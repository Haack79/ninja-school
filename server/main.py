from contextlib import asynccontextmanager

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from server.db.database import init_db
from server.routes.missions import router as missions_router

@asynccontextmanager
async def lifespan(app: FastAPI):
    init_db()

    yield


app = FastAPI(lifespan=lifespan)


origins = [
    "http://localhost:5173",
    "http://127.0.0.1:5173",
]


app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/api/health")
def dead_root():
    return {
        "status": "ok",
        "message": "The dojo is operational."
    }

app.include_router(missions_router, prefix="/api")