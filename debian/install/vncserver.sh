#!/bin/bash

echo "Install and configure vncserver to gain remote access to the graphical interface of the machine"
echo "Run 'vncserver' or 'vncserver.sh' to start the service"

apt-get update -y -qq
apt-get install --assume-yes --force-yes -qq \
	x11vnc

# Add 'vncserver' script to executable PATH
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/vncserver/vncserver.sh vncserver

unset FLAG_INTERACTIVE