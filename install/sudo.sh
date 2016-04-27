#!/bin/bash

echo "Install Sudo"
apt-get install --assume-yes --force-yes -qq \
        sudo

ensureAppExists "sudo"