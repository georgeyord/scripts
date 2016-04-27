#!/bin/bash
# Reference: http://parcellite.sourceforge.net/

echo -e "\n*** Install Parcellite - a clipboard manager"

apt-get install --assume-yes --force-yes -qq \
	parcellite

ensureAppExists "parcellite"