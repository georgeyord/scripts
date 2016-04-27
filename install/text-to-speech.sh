#!/bin/bash

echo -e "\n*** Install text-to-speech"

apt-get install --assume-yes --force-yes -qq \
        gnustep-gui-runtime

ensureAppExists "say" "text-to-speech"

say "text to speech was installed"