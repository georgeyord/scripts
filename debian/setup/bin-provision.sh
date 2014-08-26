#!/bin/bash

# Find the default user (uid 1000) to use it when a folder needs
# its permissions fixed.
DEFAULT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)

echo "Add provision script in bin folder and set the correct permissions"

mkdir -p /home/$DEFAULT_USER/bin
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /home/$DEFAULT_USER/bin/provision.sh
chmod a+x /home/$DEFAULT_USER/bin/provision.sh

sudo /home/$DEFAULT_USER/bin/provision.sh test

echo "Use '~/bin/provision.sh [scripts]' to use it"