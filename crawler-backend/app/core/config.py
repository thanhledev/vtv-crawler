from typing import List
from pydantic_settings import BaseSettings
from decouple import config


class Settings(BaseSettings):
    API_V1_STR: str = "/api/v1"
    BACKEND_CORS_ORIGINS: List[str] = [
        "*",
    ]
    PROJECT_NAME: str = "Crawler backend"

    # Database
    MONGO_CONNECTION_STRING: str = config("MONGO_CONNECTION_STRING", cast=str)

    class Config:
        case_sensitive = True


settings = Settings()
