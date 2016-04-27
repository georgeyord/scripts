#!/bin/bash

echo -e "\n*** Install Meld"
apt-get install --assume-yes --force-yes -qq \
	meld

ensureAppExists "meld"