# system
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from beanie import init_beanie
from motor.motor_asyncio import AsyncIOMotorClient
from pathlib import Path
import logging.config

# settings
from app.core.config import settings

# models
from app.models.news_model import News

# router
from app.api.api_v1.router import router

# dotenv
from dotenv import load_dotenv

# take environment variables from .env
load_dotenv()

# handle logging
log = logging.getLogger(__name__)
LOGGING_CONFIG = Path(__file__).parents[1] / 'res/logging.conf'
logging.config.fileConfig(LOGGING_CONFIG, disable_existing_loggers=False)


app = FastAPI(
    title=settings.PROJECT_NAME,
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.BACKEND_CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.on_event('startup')
async def app_init():
    """
        initialize crucial application services
    :return:
    """
    log.info("Starting up VTV Crawler Rest Services")
    db_client = AsyncIOMotorClient(settings.MONGO_CONNECTION_STRING).vtv_news_db

    await init_beanie(
        database=db_client,
        document_models=[
            News
        ]
    )

# append router
app.include_router(router, prefix=settings.API_V1_STR)


@app.get("/")
async def hello():
    return {"message": "Hello, World!"}
