from fastapi import HTTPException

import server.services.auth_service as auth_service


def signup(username, email, password, ninja_name):
    try:
        return auth_service.signup(username, email, password, ninja_name)
    except ValueError as error:
        message = str(error)
        status_code = 409 if "already exists" in message else 400
        raise HTTPException(status_code=status_code, detail=message)
