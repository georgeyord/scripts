#!/bin/bash

# Install and configure git
echo "Install and configure git"
apt-get install --assume-yes --force-yes -qq \
    git git-core git-gui git-doc

su $SUDO_USER -c "git config --global color.diff auto"
su $SUDO_USER -c "git config --global color.status auto"
su $SUDO_USER -c "git config --global color.branch auto"
su $SUDO_USER -c "git config --global core.editor 'vim'"
su $SUDO_USER -c "git config --global alias.co checkout"
su $SUDO_USER -c "git config --global alias.st status"
su $SUDO_USER -c "git config --global alias.br branch"
su $SUDO_USER -c "git config --global core.autocrlf input"
su $SUDO_USER -c "git config --global push.default simple"
