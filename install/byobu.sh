#!/bin/bash

echo -e "\n*** Install Byobu"

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_ADD_REPO=0
else
    FLAG_ADD_REPO=$(yesNo  "Do you wish to add byobu repo to get the latest version?")
fi

if [[ $FLAG_ADD_REPO == 1 ]]; then
    RELEASE=$(lsb_release -si  | tr '[:upper:]' '[:lower:]')
    addRepo '^deb http://ppa.launchpad.net/byobu/ppa/${RELEASE}\(.*\)main' "deb http://ppa.launchpad.net/byobu/ppa/ubuntu $(lsb_release -sc) main"
    addRepo '^deb-src http://ppa.launchpad.net/byobu/ppa/${RELEASE}\(.*\)main' "deb-src http://ppa.launchpad.net/byobu/ppa/ubuntu $(lsb_release -sc) main"
fi

apt-get install --assume-yes --force-yes -qq \
	byobu

mkdir -p $DEFAULT_USER_PATH/.byobu
wget -qO- ${REPO_SCRIPT_PATH}/byobu/.tmux.conf > $DEFAULT_USER_PATH/.byobu/.tmux.conf

# Set ownership to the default user
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP $DEFAULT_USER_PATH/.byobu

ensureAppExists "byobu"

byobu-enable

unset FLAG_INTERACTIVE
