#!/bin/bash

# Install and configure Vagrant
echo -e "\n*** Install and configure Vagrant"

echo "Get the latest from: https://www.vagrantup.com/downloads.html"

apt-get install -f -qq dkms

VAGRANT_FILENAME="vagrant_1.6.3_$(uname -m).deb"
wget "https://dl.bintray.com/mitchellh/vagrant/$VAGRANT_FILENAME" -O vagrant.deb
dpkg -i vagrant.deb
rm -f vagrant.deb

ensureAppExists "vagrant"

# Set ownership to the default user
mkdir -p $DEFAULT_USER_PATH/.vagrant.d/
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP $DEFAULT_USER_PATH/.vagrant.d/

vagrant plugin install vagrant-vbguest
