#!/bin/bash

echo -e "\n*** Install locally executables needed in host but run in Docker"

ensureAppExists "docker"

saveAlias ${REPO_SCRIPT_PATH}/docker-bin/docker-bin-alias.sh

ensureAppExists "docker-bin-test"
