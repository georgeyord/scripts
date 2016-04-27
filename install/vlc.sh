#!/bin/bash

echo -e "\n*** Install VLC"
apt-get install --assume-yes --force-yes -qq \
        vlc

ensureAppExists "vlc"

unset FLAG_INTERACTIVE
