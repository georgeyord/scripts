#!/bin/bash
#  ccze - A robust log colorizer

echo -e "\n*** Install and configure ccze - A robust log colorizer"
apt-get install --assume-yes --force-yes -qq \
    ccze

ensureAppExists "ccze"

echo "Usage 'tail -f -n 50 /var/log/syslog | ccze'"

unset FLAG_INTERACTIVE
