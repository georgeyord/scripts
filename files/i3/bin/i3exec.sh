#!/bin/bash

if [ -z "$1" ]; then
    echo "First argument should be a workspace, eg. '1', exiting..."
    exit 1
fi

if [ -z "$2" ]; then
    echo "Second argument should be a valid command, eg. 'cal', exiting..."
    exit 1
fi


exec i3-msg "workspace $1; exec $2" > /dev/null