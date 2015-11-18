#!/bin/bash
#  https://i3wm.org - a tiling window manager
#
# Additional apps:
# - apcalc -> calc:
#     Command line calculator, eg `cal 5*6` or `cal 'sqrt(2)'`
# 	  read more: https://apps.ubuntu.com/cat/applications/apcalc/
# - numlockx:
#     Tiny tool to have Numlock activated on boot
# 	  read more: https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup#startx
# - rofi:
#     Window switcher, run dialog and dmenu replacement
# 	  read more: https://github.com/DaveDavenport/rofi
# - suckless-tools -> dmenu:
#     Dynamic menu for X, eg `dmenu_run` and search for app
# 	  read more: http://tools.suckless.org/
#

echo "Install and configure i3 and additional helper apps, a tiling window manager"

apt-get update -y -qq
apt-get install --assume-yes --force-yes -qq \
	i3-wm i3status i3lock \
	apcalc \
	numlockx \
	rofi \
	suckless-tools

mkdir -p $DEFAULT_USER_PATH/.i3

wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/config > $DEFAULT_USER_PATH/.i3/config
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/i3status.conf > $DEFAULT_USER_PATH/.i3/i3status.conf

mkdir -p $DEFAULT_USER_PATH/.i3/workspaces

wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/workspaces/browser.json > $DEFAULT_USER_PATH/.i3/workspaces/browser.json
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/workspaces/code.json > $DEFAULT_USER_PATH/.i3/workspaces/code.json
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/workspaces/com.json > $DEFAULT_USER_PATH/.i3/workspaces/com.json
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/workspaces/docker.json > $DEFAULT_USER_PATH/.i3/workspaces/docker.json
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/workspaces/system.json > $DEFAULT_USER_PATH/.i3/workspaces/system.json
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/workspaces/term_and_sublime.json > $DEFAULT_USER_PATH/.i3/workspaces/term_and_sublime.json

# Get some usefull scripts for i3
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/bin/i3_switch_workspace.sh i3_switch_workspace
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/bin/i3exec.sh i3exec
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/bin/netspeed.sh netspeed
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/bin/xrand-dp0-dp1.sh xrand-dp0-dp1
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/bin/xrand-dp0.sh xrand-dp0
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/bin/xrand-laptop-dp0.sh xrand-laptop-dp0
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/bin/xrand-laptop-vga.sh xrand-laptop-vga
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/i3/bin/xrand-laptop.sh xrand-laptop

ln -s /usr/bin/i3lock $DEFAULT_BIN_PATH/lock

# Set ownership to the default user
chown -R $DEFAULT_USER $DEFAULT_USER_PATH/.i3

gsettings set org.gnome.desktop.background show-desktop-icons false
unset FLAG_INTERACTIVE
