#!/bin/bash

echo "Remove all dangling volumes:"
docker volume ls -qf dangling=true | xargs -r docker volume rm