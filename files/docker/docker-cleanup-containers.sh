#!/bin/bash

echo "Remove all stopped containers:"
docker ps -a | grep Exited | awk '{print $1}' | xargs --no-run-if-empty docker rm -f
