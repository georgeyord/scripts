#!/bin/bash

echo -e "\n*** Install BATS, Bash Automated Testing System"
ensureProvisionRun "git"
git clone https://github.com/sstephenson/bats.git ~/.bats
cd ~/.bats
./install.sh /usr/local
ensureAppExists "bats"

echo -e "\n*** Install shellcheck and finds bugs in your shell scripts"
apt-get install shellcheck
ensureAppExists "shellcheck"

echo -e "\n*** Install shunit2, a unit testing framework for shell scripts"
apt-get install shunit2
ensureAppExists "shunit2"

unset FLAG_INTERACTIVE
