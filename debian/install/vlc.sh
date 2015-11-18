#!/bin/bash

echo "Install Python pip"

apt-get install --assume-yes --force-yes -qq \
        python-pip

unset FLAG_INTERACTIVE
