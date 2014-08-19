#!/bin/bash

# Install SSH client
echo "Install SSH client"
apt-get install --assume-yes --force-yes -qq \
	ssh openssh-client sshpass