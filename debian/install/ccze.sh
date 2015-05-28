#!/bin/bash
#  ccze - A robust log colorizer

echo "Install and configure ccze - A robust log colorizer"
apt-get install --assume-yes --force-yes -qq \
    ccze

echo "Usage 'tail -f -n 50 /var/log/syslog | ccze'"

unset FLAG_INTERACTIVE
