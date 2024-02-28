import os
from typing import List, Union
from pydantic import BaseSettings, Field
from pathlib import Path


class Base(BaseSettings):
    API_V1_STR: str = "/api/v1"
    BACKEND_CORS_ORIGINS: List[str] = [
        "*",
    ]
    PROJECT_NAME: str = "Crawler backend - Base Mode"

    # Database
    MONGO_CONNECTION_STRING: str = Field("MONGO_CONNECTION_STRING", cast=str)

    class Config:
        case_sensitive = True
        env_file = ".env"


class Dev(Base):
    PROJECT_NAME: str = "Crawler backend - Dev mode"

    class Config:
        env_file = Path(__file__).parents[2] / 'res/dev.env'


class Prod(Base):
    PROJECT_NAME: str = "Crawler backend - Prod mode"

    class Config:
        env_file = Path(__file__).parents[2] / 'res/prod.env'


config = dict(
    dev=Dev,
    prod=Prod
)

settings: Union[Dev, Prod] = config[os.environ.get('MODE', 'dev').lower()]()
