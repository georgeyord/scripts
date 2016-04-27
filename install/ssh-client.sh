#!/bin/bash

echo -e "\n*** Install SSH client"
apt-get install --assume-yes --force-yes -qq \
	ssh openssh-client sshpass

ensureAppExists "ssh"
ensureAppExists "sshpass" "ssh"