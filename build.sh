#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage:    ./build.sh --all"
    echo "  e.g:    ./build.sh <module>"
    echo "  e.g:    ./build.sh <module> <module> ..."
    exit
fi

function run {
	echo "================================"
	echo "Building Bootiful Micro Pizza..."
	echo "================================"
	echo ""

	if [ $1 = "--all" ]
	then
		buildAll
		exit
	fi

    for item in "$@"
    do
        build $item
    done

	echo ""
	echo "==============="
	echo "Build complete."
	echo "==============="
}

function buildAll {
	for module in account-service\
		config-service\
		inventory-service\
		order-service\
		api-gateway\
		registry-service\
		website-api-gateway;
	do
		build $module
	done
}

function build {
	module=$1
	echo "Building module $module..."
	cd services/$module
	mvn clean package

	if [ "$?" != "0" ]; then
    	echo "[Error] Build failed for module $module. " 1>&2
    	exit 1
	fi

	cd ../..

	echo "Building Docker image for $module..."
	docker-compose build $module	

	if [ "$?" != "0" ]; then
		echo "[Error] Docker image build failed." 1>&2
		exit 1
	fi
}

run $@
