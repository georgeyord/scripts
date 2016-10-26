#!/bin/bash

echo -e "\n*** Install asciinema - record and share a terminal session"
apt-get install --assume-yes --force-yes -qq \
  asciinema

ensureAppExists "asciinema"
