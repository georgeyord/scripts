#!/bin/bash

echo "Install and configure VirtualBox"

function addRepo() {
    if ! grep -q "$1" /etc/apt/sources.list; then
        echo "Adding new apt source '$2'"
        echo $2 >> /etc/apt/sources.list
    fi
}

apt-get --assume-yes --force-yes -qq purge virtualbox

addRepo '^deb http://download.virtualbox.org/virtualbox/debian\(.*\)contrib' "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -

apt-get -y -qq update

apt-get install --assume-yes --force-yes -qq \
    dkms virtualbox
