from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routers import auth, profile, credit, result, timetable, parameter, search, courseSelection, notification


app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(auth.router)
app.include_router(profile.router)
app.include_router(credit.router)
app.include_router(result.router)
app.include_router(timetable.router)
app.include_router(parameter.router)
app.include_router(search.router)
app.include_router(courseSelection.router)
app.include_router(notification.router)
