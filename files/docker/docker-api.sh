#!/bin/bash

if [[ -z $1 ]]; then
  echo "HTTP/1.0 404 Not Found";exit 1
fi

echo -e "GET $1 HTTP/1.0\r\n" | nc -U /var/run/docker.sock
