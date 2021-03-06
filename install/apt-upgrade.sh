#!/bin/bash

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to update applications and Ubuntu?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    # Update/upgrade distro
    echo -e "\n*** Update/upgrade apps and distro"

    # Fix "stdin is not a tty" in ubutnu
    sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
    . ~/.profile

    # Disable the apt cache - We don't need it in a container and it would make the image bigger
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

    FLAG_ADD_REPOS=$(yesNo  "Do you wish to add multiverse repos (highly recommended for development related applications)?")
    if [[ $FLAG_ADD_REPOS == 1 ]]; then
        FLAG_INTERACTIVE=0
        addRepo '^deb http://archive.ubuntu.com/ubuntu\(.*\)main' "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main"
        addRepo '^deb http://archive.ubuntu.com/ubuntu\(.*\)universe' "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
        addRepo '^deb http://archive.ubuntu.com/ubuntu\(.*\)multiverse' "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse"
        addRepo '^deb-src http://archive.ubuntu.com/ubuntu\(.*\)main' "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main"
        addRepo '^deb-src http://archive.ubuntu.com/ubuntu\(.*\)universe' "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
        addRepo '^deb-src http://archive.ubuntu.com/ubuntu\(.*\)multiverse' "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse"
    fi

    apt-get -y -qq update
    apt-get -y -qq upgrade
    apt-get install -f -qq;
fi

unset FLAG_INTERACTIVE
