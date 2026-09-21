import server.services.mission_service as mission_service

def get_missions():
    missions = mission_service.get_all_missions()
    # with fastapi we don't need to return a response object, we can just return the data cause python will automatically convert it to a JSON response.
    return missions
