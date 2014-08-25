#!/bin/bash

# Install and configure Vagrant
echo "Install and configure Vagrant"

echo "Get the latest from: https://www.vagrantup.com/downloads.html"

apt-get install -f -qq dkms

VAGRANT_FILENAME="vagrant_1.6.3_$(uname -m).deb"
wget "https://dl.bintray.com/mitchellh/vagrant/$VAGRANT_FILENAME" -O vagrant.deb
dpkg -i vagrant.deb
rm -f vagrant.deb

# Set ownership to the default user
VAGRANT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)
chown -R $VAGRANT_USER ~/.vagrant.d/

vagrant plugin install vagrant-vbguest
