#!/bin/bash

function addRepo() {
    if ! grep -q "$1" /etc/apt/sources.list; then
        echo "Adding new apt source '$2'"
        echo $2 >> /etc/apt/sources.list
    fi
}

# Install Dropbox
echo "Install Dropbox"

apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
addRepo '^deb http://linux.dropbox.com/ubuntu/\(.*\)main' "deb deb http://linux.dropbox.com/ubuntu/ $(lsb_release -sc) main"

apt-get -y -qq update
apt-get install --assume-yes --force-yes -qq dropbox 


