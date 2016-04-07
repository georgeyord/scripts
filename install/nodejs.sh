#!/bin/bash

# Install node.js
echo "Install node.js"

source <(curl -sL https://deb.nodesource.com/setup_4.x)
apt-get install --assume-yes --force-yes -qq nodejs
