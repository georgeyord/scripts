#!/bin/bash

echo "Install SSH client"
apt-get install --assume-yes --force-yes -qq \
	ssh openssh-client sshpass

ensureAppExists "ssh"
ensureAppExists "sshpass" "ssh"