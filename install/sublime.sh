#!/bin/bash

echo -e "\n*** Install Sublime 3"

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
addRepo '^deb https://download.sublimetext.com/ apt/stable/' "deb https://download.sublimetext.com/ apt/stable/"
apt-get update -qq

apt-get install --assume-yes --force-yes -qq \
        sublime-text

ensureAppExists "subl" "sublime"

unset FLAG_INTERACTIVE
