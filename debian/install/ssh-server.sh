#!/bin/bash

# Install SSH server
echo "Install SSH server"
apt-get install --assume-yes --force-yes -qq \
	ssh ssh-server


if [[ $INTERACTIVE = 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to MANUALLY install PhpStorm?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    read -p "Which port to use for SSH? Default: 22" PORT

    if  [ ! $PORT == "" ]; then
        sed --in-place=.orig "s/Port 2200/Port $PORT/" /etc/ssh/sshd_config
    fi
fi

unset FLAG_INTERACTIVE
