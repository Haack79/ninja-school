import sqlite3

import bcrypt

from server.db.database import get_db


def signup(username, email, password, ninja_name):
    if not username or not email or not password or not ninja_name:
        raise ValueError("Username, email, password, and ninja name are required")

    username = username.strip()
    email = email.strip()
    ninja_name = ninja_name.strip()

    if not username or not email or not password or not ninja_name:
        raise ValueError("Username, email, password, and ninja name are required")

    password_hash = bcrypt.hashpw(
        password.encode("utf-8"),
        bcrypt.gensalt(),
    ).decode("utf-8")

    connection = get_db()
    try:
        cursor = connection.execute(
            "INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)",
            (username, email, password_hash),
        )
        user_id = cursor.lastrowid

        cursor = connection.execute(
            "INSERT INTO ninjas (user_id, name) VALUES (?, ?)",
            (user_id, ninja_name),
        )
        ninja_id = cursor.lastrowid

        connection.commit()
    except sqlite3.IntegrityError:
        connection.rollback()
        raise ValueError("Username or email already exists")
    finally:
        connection.close()

    return {
        "user": {"id": user_id, "username": username, "email": email},
        "ninja": {"id": ninja_id, "user_id": user_id, "name": ninja_name},
    }
