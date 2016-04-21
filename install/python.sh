#!/bin/bash

echo "Install Python with pip"

apt-get install --assume-yes --force-yes -qq \
        python python-dev python-pip \
        python-virtualenv libmysqlclient-dev \
        libxml2-dev libxslt1-dev libffi-dev

unset FLAG_INTERACTIVE
