#!/bin/bash

echo "Install BATS, Bash Automated Testing System"

ensureProvisionRun "git"

git clone https://github.com/sstephenson/bats.git ~/.bats
cd ~/.bats
./install.sh /usr/local
ensureAppExists "bats"

unset FLAG_INTERACTIVE
