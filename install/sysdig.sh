#!/bin/bash

echo -e "\n*** Install sysdig - a Linux system exploration and troubleshooting tool with first class support for containers"

curl -s https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public | apt-key add -
curl -s -o /etc/apt/sources.list.d/draios.list http://download.draios.com/stable/deb/draios.list

apt-get -y -qq update
apt-get install --assume-yes --force-yes -qq \
	sysdig

ensureAppExists "csysdig" "sysdig"

echo "Start using sysdig using 'csysdig'"
