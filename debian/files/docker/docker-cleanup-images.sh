#!/bin/bash

echo "Clean up un-tagged docker images:"
docker images -q --filter "dangling=true" | xargs --no-run-if-empty docker volume rmi
