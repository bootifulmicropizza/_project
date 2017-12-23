#!/bin/bash

echo "Stopping Bootiful Micro Pizza..."
docker-compose stop
docker-compose rm -f
echo "Done"
