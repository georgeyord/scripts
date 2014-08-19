#!/bin/bash

function addRepo() {
    if ! grep -q "$1" /etc/apt/sources.list; then
        echo "Adding new apt source '$2'"
        echo $2 >> /etc/apt/sources.list
    fi
}

# Install basic tools
echo "Install basic tools"
apt-get install --assume-yes --force-yes -qq \
    python-software-properties

add-apt-repository -y ppa:webupd8team/java
apt-get update -qq

apt-get install --assume-yes --force-yes -qq \
    oracle-java8-installer