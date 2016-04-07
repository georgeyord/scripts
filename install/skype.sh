#!/bin/bash

echo "Install Skype"

apt-get install --assume-yes --force-yes -qq \
        skype

unset FLAG_INTERACTIVE
