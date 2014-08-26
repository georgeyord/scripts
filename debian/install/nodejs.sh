#!/bin/bash

# Install node.js
echo "Install node.js"
apt-add-repository -y ppa:chris-lea/node.js > /dev/null

apt-get update -y -qq
apt-get install --assume-yes --force-yes -qq nodejs