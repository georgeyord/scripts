#!/bin/bash

# Install Google Chrome
echo "Install Google Chrome"
apt-get install --assume-yes --force-yes -qq \
	libxss1 libappindicator1 libindicator7

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

dpkg -i ./google-chrome*.deb

rm ./google-chrome*.deb
