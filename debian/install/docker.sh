#!/bin/bash

# Install docker.io
echo "Install docker.io"

# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get update -y -qq
	apt-get install --assume-yes --force-yes -qq apt-transport-https
fi

curl -s https://get.docker.io/ubuntu/ | sh

# Add the docker group if it doesn't already exist.
groupadd docker

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
gpasswd -a ${USER} docker
gpasswd -a ${SUDO_USER} docker

# Add current user to the docker group to run docker commands without sudo
usermod -aG docker $USER
usermod -aG docker $SUDO_USER

# Restart the Docker daemon.
# If you are in Ubuntu 14.04, use docker.io instead of docker
service docker restart