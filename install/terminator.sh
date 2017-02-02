#!/bin/bash

echo -e "\n*** Install terminator"
apt-get install --assume-yes --force-yes -qq \
    terminator

ensureAppExists "terminator"
