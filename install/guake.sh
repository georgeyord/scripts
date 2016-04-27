#!/bin/bash

echo "Install Guake"
apt-get install --assume-yes --force-yes -qq \
				guake

ensureAppExists "guake"