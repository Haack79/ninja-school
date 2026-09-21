from server.db.database import get_db

def get_all_missions():
    connection = get_db()
    dict_missions = []
    # fetchall gets sqlite3.Row, which is a dictionary-like object that allows us to access columns by name. We convert it to a dictionary using dict().
    missions = connection.execute("SELECT * FROM missions ORDER BY difficulty").fetchall()
    connection.close()
    # could have done return [dict(mission) for mission in missions]. 
    for mission in missions:
        dict_missions.append(dict(mission))
    return dict_missions
