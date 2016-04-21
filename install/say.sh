#!/bin/bash

echo "Install text-to-speech"

apt-get install --assume-yes --force-yes -qq \
        gnustep-gui-runtime

say "text to speech installed"