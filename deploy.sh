#!/bin/bash

echo "🧼 Cleaning up old containers..."
#docker rm -f backend 2>/dev/null

echo "🚀 Building and running with Docker Compose..."
docker-compose up -d --build
