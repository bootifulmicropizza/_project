#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage:    ./start.sh --all"
    echo "  e.g:    ./start.sh <module>"
    echo "  e.g:    ./start.sh <module> <module> ..."
    exit
fi

function run {
	echo "================================"
	echo "Starting Bootiful Micro Pizza..."
	echo "================================"
	echo ""

	if [ $1 = "--all" ]
	then
		start website-gateway-cache
		startAll
		exit
	fi

    for item in "$@"
    do
        start $item
    done

	echo ""
	echo "============================="
	echo "Started Bootiful Micro Pizza."
	echo "============================="
}

function startAll {
	docker-compose up -d
}

function start {
	module=$1
	echo "Starting module $module..."
	docker-compose up -d $module
	
	if [ "$?" != "0" ]; then
    	echo "[Error] Failed to start module $module. " 1>&2
    	exit 1
	fi
}

run $@
