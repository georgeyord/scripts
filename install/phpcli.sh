#!/bin/bash

echo -e "\n*** Install php5 cli and tools"
apt-get install --assume-yes --force-yes -qq \
    php5-common php5-cli php5-curl php5-mysql
