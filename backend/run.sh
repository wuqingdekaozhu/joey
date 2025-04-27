#!/bin/bash

docker compose up -d

uvicorn app.main:app --host 0.0.0.0 --port 8000
