#!/bin/bash

echo -e "\n*** Install Sublime 3"
add-apt-repository -y ppa:webupd8team/sublime-text-3
apt-get update -qq

apt-get install --assume-yes --force-yes -qq \
        sublime-text-installer

ensureAppExists "subl" "sublime"

unset FLAG_INTERACTIVE