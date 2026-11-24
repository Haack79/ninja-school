from fastapi import APIRouter
from pydantic import BaseModel

import server.controllers.auth_controller as auth_controller

router = APIRouter()


class SignupBody(BaseModel):
    username: str
    email: str
    password: str
    ninja_name: str


@router.post("/auth/signup", status_code=201)
def signup(body: SignupBody):
    return auth_controller.signup(
        body.username,
        body.email,
        body.password,
        body.ninja_name,
    )
