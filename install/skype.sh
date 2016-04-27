#!/bin/bash

echo -e "\n*** Install Skype"

apt-get install --assume-yes --force-yes -qq \
        skype

ensureAppExists "skype"

unset FLAG_INTERACTIVE
