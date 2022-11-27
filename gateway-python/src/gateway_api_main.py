"""This module acts as the gateway API for microservices. Uses the FastAPI package."""

# import datetime
# import json
# from typing import Optional, Union, Dict
# from application.requests_responses import *
# import uvicorn
# from application.closed_auction_metrics_service import ClosedAuctionMetricsService
# from domain.auction_repository import AuctionRepository, InMemoryAuctionRepository
# from domain.auction_repository_mongo import MongoDbAuctionRepository
# import asyncio
# import pika, sys, os
# from multiprocessing import Process, Manager
# from multiprocessing.managers import BaseManager
# from infrastructure import utils
# from domain.bid import Bid
# from domain.closed_auction import ClosedAuction
# from fastapi.responses import HTMLResponse
# import pprint
# from fastapi.responses import RedirectResponse
from fastapi import FastAPI, Header, HTTPException, APIRouter, Response
import httpx, uvicorn
import requests
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Hello World"}

@app.get("/api/v1/Auctions/{path:path}")
def tile_request(path: str, response: Response):
    proxy_response = requests.get(f"http://auctions-service:10000/api/v1/Auctions/{path}")
    response.body = proxy_response.content
    response.status_code = proxy_response.status_code
    return response

if __name__ == "__main__":
    PORT=8080
    uvicorn.run("gateway_api_main:app", host="0.0.0.0",port=PORT,reload=True)
