#!/bin/bash

echo "Building Bootiful Micro Pizza..."

for module in account-service\
	config-service\
	inventory-service\
	order-service\
	api-gateway\
	registry-service\
	website-api-gateway;
do
	echo "Building module $module..."
	cd services/$module
	mvn clean package -DskipTests=true

	if [ "$?" != "0" ]; then
    	echo "[Error] Build failed for module $module. " 1>&2
    	exit 1
	fi

	cd ../..
done

echo "Building Docker images..."
docker-compose build

if [ "$?" != "0" ]; then
	echo "[Error] Docker image build failed." 1>&2
	exit 1
fi

echo ""
echo "Build complete."
