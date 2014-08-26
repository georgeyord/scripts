#!/bin/bash

# Install and configure git
echo "Install and configure git"
apt-get install --assume-yes --force-yes -qq \
    git git-core git-gui git-doc

su $DEFAULT_USER -c "git config --global color.diff auto"
su $DEFAULT_USER -c "git config --global color.status auto"
su $DEFAULT_USER -c "git config --global color.branch auto"
su $DEFAULT_USER -c "git config --global core.editor 'vim'"
su $DEFAULT_USER -c "git config --global alias.co checkout"
su $DEFAULT_USER -c "git config --global alias.st status"
su $DEFAULT_USER -c "git config --global alias.br branch"
su $DEFAULT_USER -c "git config --global core.autocrlf input"
su $DEFAULT_USER -c "git config --global push.default simple"


if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to set the Git user details?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    if [[ $(getInput "Set Git email? ") == 1 ]]; then
        SMB_EMAIL=$(getInput "Git email: ")
        su $DEFAULT_USER -c "git config --global user.email $SMB_EMAIL"
    fi
    if [[ $(getInput "Set Git username? ") == 1 ]]; then
        SMB_USER=$(getInput "Git username: ")
        su $DEFAULT_USER -c "git config --global user.email $SMB_USER"
    fi
fi

unset FLAG_INTERACTIVE