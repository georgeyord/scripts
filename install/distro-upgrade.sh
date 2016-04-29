#!/bin/bash

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to upgrade Ubuntu?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    # Fix "stdin is not a tty" in ubutnu
    sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
    . ~/.profile

    # Disable the apt cache - We don't need it in a container and it would make the image bigger
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

    apt-get -y -qq update
    apt-get -y -qq dist-upgrade
    apt-get install -f -qq;
fi

unset FLAG_INTERACTIVE
