#!/bin/bash

alias docker-bin-test='echo "Open in browser: http://localhost:18080" && docker run --rm -it -p 10800:8000 -t jwilder/whoami'
alias htpasswd='docker run --rm -ti crosbymichael/htpasswd'
