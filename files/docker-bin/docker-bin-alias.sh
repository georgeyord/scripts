#!/bin/bash

DOCKER_BIN_TEST_PORT=18080
alias docker-bin-test='echo "Open in browser: http://localhost:${DOCKER_BIN_TEST_PORT}" && docker run --rm -it -p ${DOCKER_BIN_TEST_PORT}:8000 -t jwilder/whoami'
alias htpasswd='docker run --rm -ti crosbymichael/htpasswd'
