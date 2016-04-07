#!/bin/bash

# Install node.js
echo "Install node.js"

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install --assume-yes --force-yes -qq nodejs
