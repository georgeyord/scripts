#!/bin/bash

# Install PHP5 CLI
echo "Install php5 and tools"
apt-get install --assume-yes --force-yes -qq \
    php5-common php5-cli php5-curl php5-mysql
