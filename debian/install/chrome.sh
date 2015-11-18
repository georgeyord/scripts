#!/bin/bash

# Install Google Chrome
echo "Install Google Chrome"
apt-get install --assume-yes --force-yes -qq \
	libxss1 libappindicator1 libindicator7

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

apt-get update -qq

apt-get install --assume-yes --force-yes -qq \
        google-chrome-stable
