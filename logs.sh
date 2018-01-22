#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage:    ./logs.sh --all"
    echo "  e.g:    ./logs.sh <module>"
    echo "  e.g:    ./logs.sh <module> <module> ..."
    exit
fi

function run {
	if [ $1 = "--all" ]
	then
		logsAll
		exit
	fi

	docker-compose logs -f $@
}

function logsAll {
	docker-compose logs -f
}

run $@
