#!/bin/bash

echo "Install VLC"

apt-get install --assume-yes --force-yes -qq \
        vlc

unset FLAG_INTERACTIVE
