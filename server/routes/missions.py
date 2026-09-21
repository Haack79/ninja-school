from fastapi import APIRouter

import server.controllers.missions_controller as missions_controller

router = APIRouter()

@router.get("/missions")
def get_missions():
    return missions_controller.get_missions()