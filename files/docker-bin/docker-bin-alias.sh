#!/bin/bash

DOCKER_BIN_TEST_PORT=18080
alias docker-bin-test='echo "Open in browser: http://localhost:${DOCKER_BIN_TEST_PORT}" && docker run --rm -it -p ${DOCKER_BIN_TEST_PORT}:8000 -t jwilder/whoami'
alias docker-server-static='echo "Serving "${1:-`pwd`}" at : http://localhost:${2:-8088}" && docker run -it --rm --volume="${1:-`pwd`}:/static:ro" -p="${2:-8088}:80" georgeyord/static-file-server-nginx'
alias htpasswd='docker run --rm -ti crosbymichael/htpasswd'
