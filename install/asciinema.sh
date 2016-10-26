#!/bin/bash

echo -e "\n*** Install basic tools"
apt-get install --assume-yes --force-yes -qq \
  asciinema

ensureAppExists "asciinema"
