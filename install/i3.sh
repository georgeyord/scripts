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

echo -e "\n*** Install and configure i3 and additional helper apps, a tiling window manager"

apt-get update -y -qq
apt-get install --assume-yes --force-yes -qq \
	i3-wm i3status i3lock \
	apcalc \
	numlockx \
	rofi \
	suckless-tools

ensureAppExists "i3"
ensureAppExists "i3status" "i3"
ensureAppExists "i3lock" "i3"
ensureAppExists "apcalc" "i3"
ensureAppExists "numlockx" "i3"
ensureAppExists "rofi" "i3"

mkdir -p $DEFAULT_USER_PATH/.i3

wget -qO- ${REPO_SCRIPT_PATH}/i3/config > $DEFAULT_USER_PATH/.i3/config
wget -qO- ${REPO_SCRIPT_PATH}/i3/i3status.conf > $DEFAULT_USER_PATH/.i3/i3status.conf

mkdir -p $DEFAULT_USER_PATH/.i3/workspaces

wget -qO- ${REPO_SCRIPT_PATH}/i3/workspaces/main.json > $DEFAULT_USER_PATH/.i3/workspaces/main.json
wget -qO- ${REPO_SCRIPT_PATH}/i3/workspaces/editor.json > $DEFAULT_USER_PATH/.i3/workspaces/editor.json
wget -qO- ${REPO_SCRIPT_PATH}/i3/workspaces/code.json > $DEFAULT_USER_PATH/.i3/workspaces/code.json
wget -qO- ${REPO_SCRIPT_PATH}/i3/workspaces/browser.json > $DEFAULT_USER_PATH/.i3/workspaces/browser.json
wget -qO- ${REPO_SCRIPT_PATH}/i3/workspaces/docker.json > $DEFAULT_USER_PATH/.i3/workspaces/docker.json
wget -qO- ${REPO_SCRIPT_PATH}/i3/workspaces/system.json > $DEFAULT_USER_PATH/.i3/workspaces/system.json
wget -qO- ${REPO_SCRIPT_PATH}/i3/workspaces/com.json > $DEFAULT_USER_PATH/.i3/workspaces/com.json

# Get some usefull scripts for i3
saveExecutableToBin ${REPO_SCRIPT_PATH}/i3/bin/i3_switch_workspace.sh i3_switch_workspace
saveExecutableToBin ${REPO_SCRIPT_PATH}/i3/bin/i3exec.sh i3exec
saveExecutableToBin ${REPO_SCRIPT_PATH}/i3/bin/netspeed.sh netspeed
saveExecutableToBin ${REPO_SCRIPT_PATH}/i3/bin/xrand-dp0-dp1.sh xrand-dp0-dp1
saveExecutableToBin ${REPO_SCRIPT_PATH}/i3/bin/xrand-dp0.sh xrand-dp0
saveExecutableToBin ${REPO_SCRIPT_PATH}/i3/bin/xrand-laptop-dp0.sh xrand-laptop-dp0
saveExecutableToBin ${REPO_SCRIPT_PATH}/i3/bin/xrand-laptop-vga.sh xrand-laptop-vga
saveExecutableToBin ${REPO_SCRIPT_PATH}/i3/bin/xrand-laptop.sh xrand-laptop

ln -s /usr/bin/i3lock $DEFAULT_BIN_PATH/lock

# Set ownership to the default user
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP $DEFAULT_USER_PATH/.i3

gsettings set org.gnome.desktop.background show-desktop-icons false
unset FLAG_INTERACTIVE
