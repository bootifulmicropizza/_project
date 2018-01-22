#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage:    ./stop.sh --all"
    echo "  e.g:    ./stop.sh <module>"
    echo "  e.g:    ./stop.sh <module> <module> ..."
    exit
fi

function run {
	echo "================================"
	echo "Stopping Bootiful Micro Pizza..."
	echo "================================"
	echo ""

	if [ $1 = "--all" ]
	then
		stopAll
		exit
	fi

    for item in "$@"
    do
        stop $item
    done

	echo ""
	echo "============================="
	echo "Stopped Bootiful Micro Pizza."
	echo "============================="
}

function stopAll {
	docker-compose stop
	docker-compose rm -f
}

function stop {
	module=$1
	echo "Stopping module $module..."
	docker-compose stop $module
	docker-compose rm -f $module
	
	if [ "$?" != "0" ]; then
    	echo "[Error] Failed to stop module $module. " 1>&2
    	exit 1
	fi
}

run $@
