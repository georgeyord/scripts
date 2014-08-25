#!/bin/bash

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=1
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to update applcations and upgrade Ubuntu?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    # Update/upgrade distro
    echo "Update/upgrade apps and distro"

    # Fix "stdin is not a tty" in ubutnu
    sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
    . ~/.profile

    # Disable the apt cache - We don't need it in a container and it would make the image bigger
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

    function addRepo() {
        if ! grep -q "$1" /etc/apt/sources.list; then
            echo "Adding new apt source '$2'"
            echo $2 >> /etc/apt/sources.list
        fi
    }

    addRepo '^deb http://archive.ubuntu.com/ubuntu\(.*\)main' "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main"
    addRepo '^deb http://archive.ubuntu.com/ubuntu\(.*\)universe' "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
    addRepo '^deb http://archive.ubuntu.com/ubuntu\(.*\)multiverse' "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse"
    addRepo '^deb-src http://archive.ubuntu.com/ubuntu\(.*\)main' "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main"
    addRepo '^deb-src http://archive.ubuntu.com/ubuntu\(.*\)universe' "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
    addRepo '^deb-src http://archive.ubuntu.com/ubuntu\(.*\)multiverse' "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse"

    apt-get -y -qq update
    apt-get -y -qq dist-upgrade
    apt-get -y -qq upgrade
    apt-get install -f -qq;
fi

env -u FLAG_INTERACTIVE