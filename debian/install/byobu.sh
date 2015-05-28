#!/bin/bash

# Install Byobu
echo "Install Byobu"

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_ADD_REPO=0
else
    FLAG_ADD_REPO=$(yesNo  "Do you wish to add byobu repo to get the latest version?")
fi

if [[ $FLAG_ADD_REPO == 1 ]]; then
    addRepo '^deb http://ppa.launchpad.net/byobu/ppa/ubuntu\(.*\)main' "deb http://ppa.launchpad.net/byobu/ppa/ubuntu $(lsb_release -sc) main"
    addRepo '^deb-src http://ppa.launchpad.net/byobu/ppa/ubuntu\(.*\)main' "deb-src http://ppa.launchpad.net/byobu/ppa/ubuntu $(lsb_release -sc) main"
fi

apt-get install --assume-yes --force-yes -qq \
	byobu

mkdir -p $DEFAULT_USER_PATH/.byobu
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/byobu/.tmux.conf > $DEFAULT_USER_PATH/.byobu/.tmux.conf

byobu-enable

unset FLAG_INTERACTIVE