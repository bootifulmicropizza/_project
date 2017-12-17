#!/bin/bash

docker-compose stop
docker-compose rm -f

for module in account-service\
	config-service\
	inventory-service\
	order-service\
	api-gateway\
	registry-service\
	website-api-gateway;
do
	echo ""
	echo "Building $module..."
	cd services/$module
	mvn clean package -DskipTests=true
	cd ../..
done

docker-compose up -d --build
docker-compose logs -f
