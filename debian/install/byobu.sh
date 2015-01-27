#!/bin/bash

# Install Byobu
echo "Install Byobu"
apt-get install --assume-yes --force-yes -qq \
	byobu

mkdir -p $DEFAULT_USER_PATH/.byobu
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/gitprompt/byobu/.tmux.conf > $DEFAULT_USER_PATH/.byobu/.tmux.conf

byobu-enable
