#!/bin/bash

mkdir ~/bin
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh

sudo /tmp/provision.sh distro-upgrade basic-tools nodejs git docker apt-cleanup disk-space
