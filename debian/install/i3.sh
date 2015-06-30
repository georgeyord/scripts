#!/bin/bash
#  https://i3wm.org - a tiling window manager


echo "Install and configure i3, a tiling window manager"
apt-get update -y -qq
apt-get install --assume-yes --force-yes -qq i3-wm i3status sickless-tools i3lock

mkdir -p $DEFAULT_USER_PATH/.i3

wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/config > $DEFAULT_USER_PATH/.i3/config
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/i3status.conf > $DEFAULT_USER_PATH/.i3/i3status.conf

# Set ownership to the default user
chown -R $DEFAULT_USER $DEFAULT_USER_PATH/.i3

unset FLAG_INTERACTIVE