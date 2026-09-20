import sqlite3
from pathlib import Path


DB_DIR = Path(__file__).parent
DB_PATH = DB_DIR / "ninja_school.db"
SCHEMA_PATH = DB_DIR / "schema.sql"
SEED_PATH = DB_DIR / "seed.sql"


def get_db():
    connection = sqlite3.connect(DB_PATH)

    # Lets us access columns by name:
    # ninja["name"] instead of ninja[1]
    connection.row_factory = sqlite3.Row

    # SQLite requires foreign key enforcement to be enabled
    connection.execute("PRAGMA foreign_keys = ON")

    return connection


def init_db():
    connection = get_db()

    with open(SCHEMA_PATH, "r") as file:
        connection.executescript(file.read())

    connection.close()


def seed_db():
    connection = get_db()

    with open(SEED_PATH, "r") as file:
        connection.executescript(file.read())

    connection.commit()
    connection.close()