#!/bin/bash

echo "Install BATS, Bash Automated Testing System"

$EXISTS=$(appExists git)
if [[ $EXISTS == 0 ]]; then
    if [[ $INTERACTIVE == 0 ]]; then
        echo "***** BATS FAILED: Git is required for BATS installation, please add 'git' to provision.sh script before 'bats'."
    else
        whenContinue "***** BATS FAILED: Git is required for BATS installation, please add 'git' to provision.sh script before 'bats'."
    fi
else
  git clone https://github.com/sstephenson/bats.git ~/.bats
  cd ~/.bats
  sudo ./install.sh /usr/local
fi

unset FLAG_INTERACTIVE
