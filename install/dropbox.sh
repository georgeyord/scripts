#!/bin/bash

function addRepo() {
    if ! grep -q "$1" /etc/apt/sources.list; then
        echo "Adding new apt source '$2'"
        echo $2 >> /etc/apt/sources.list
    fi
}

echo "Install Dropbox"
DROPBOX_VERSION='2015.10.28_amd64'

wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_${DROPBOX_VERSION}.deb -O /tmp/dropbox.deb
dpkg -i /tmp/dropbox.deb

# apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
# addRepo '^deb http://linux.dropbox.com/ubuntu/\(.*\)main' "deb http://linux.dropbox.com/ubuntu/ $(lsb_release -sc) main"

# apt-get -y -qq update
# apt-get install --assume-yes --force-yes -qq dropbox

# Set ownership to the default user
mkdir -p $DEFAULT_USER_PATH/.dropbox
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP $DEFAULT_USER_PATH/.dropbox*
