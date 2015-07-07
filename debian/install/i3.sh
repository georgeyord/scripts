#!/bin/bash
#  https://i3wm.org - a tiling window manager
#
# Additional apps:
# - apcalc -> calc: Command line calculator, eg `cal 5*6` or `cal 'sqrt(2)'`
# - suckless-tools -> dmenu: A dynamic menu for X, eg `dmenu_run` and search for app
#
# References:
# - https://apps.ubuntu.com/cat/applications/apcalc/
# - http://tools.suckless.org/

echo "Install and configure i3 and additional helper apps, a tiling window manager"

apt-get update -y -qq
apt-get install --assume-yes --force-yes -qq \
	i3-wm i3status i3lock \
	suckless-tools \
	apcalc \
	numlockx

mkdir -p $DEFAULT_USER_PATH/.i3

wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/config > $DEFAULT_USER_PATH/.i3/config
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/i3status.conf > $DEFAULT_USER_PATH/.i3/i3status.conf

# Set ownership to the default user
chown -R $DEFAULT_USER $DEFAULT_USER_PATH/.i3

gsettings set org.gnome.desktop.background show-desktop-icons false
unset FLAG_INTERACTIVE