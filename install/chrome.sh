#!/bin/bash

echo "Install Google Chrome"
apt-get install --assume-yes --force-yes -qq \
	libxss1 libappindicator1 libindicator7

wget -qO- https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /tmp/google-chrome-stable.deb
dpkg -i /tmp/google-chrome-stable.deb
