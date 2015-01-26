#!/bin/bash

# Install Byobu
echo "Install Byobu"
apt-get install --assume-yes --force-yes -qq \
	byobu

byobu-enable
