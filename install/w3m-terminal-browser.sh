#!/bin/bash
#  ccze - A robust log colorizer

echo "Install and configure w3m - A terminal browser"
apt-get install --assume-yes --force-yes -qq \
    w3m w3m-img

echo -e "Open a webpage: w3m <url_of_the_webpage>\nOpen a new page: type Shift-U\nGo back: Shift-B\nNew tab: Shift-T"
sleep 1

unset FLAG_INTERACTIVE
