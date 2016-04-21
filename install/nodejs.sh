#!/bin/bash

echo "Install node.js"

apt-get install -f -qq
source <(curl -sL https://deb.nodesource.com/setup_4.x)
apt-get install --assume-yes --force-yes -qq nodejs
