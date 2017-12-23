#!/bin/bash

echo "Starting Bootiful Micro Pizza..."

docker-compose up -d
docker-compose logs -f
