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

# Add the default user (uid 1000) to the docker group.
# You may have to logout and log back in again for
# this to take effect.
gpasswd -a $DEFAULT_USER docker

# Restart the Docker daemon.
service docker restart

if [[ $INTERACTIVE == 1 ]] && [[ $(yesNo  "Do you wish to setup Docker access to hub?") == 1 ]]; then
    # This will generate a ~/.dockercfg file
    su $DEFAULT_USER -c "docker login"

    # Set ownership to the default user
    chown -R  $DEFAULT_USER /home/$DEFAULT_USER/.dockercfg
fi

# Install Fig script
curl -L https://github.com/docker/fig/releases/download/0.5.2/linux > /usr/local/bin/fig
chmod +x /usr/local/bin/fig

unset FLAG_INTERACTIVE
