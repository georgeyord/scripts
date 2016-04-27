#!/bin/bash

echo "Install Python with pip"

apt-get install --assume-yes --force-yes -qq \
        build-essential \
        python \
        python-dev \
        python-pip \
        python-setuptools \
        python-virtualenv \
        libmysqlclient-dev \
        libffi-dev \
        libssl-dev \
        libxml2-dev \
        libxslt1-dev

ensureAppExists "python"
ensureAppExists "pip" "python"

unset FLAG_INTERACTIVE
