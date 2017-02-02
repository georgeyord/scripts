#!/bin/bash

echo -e "\n*** Install Remmina, a Remote Desktop Client (VNC/RDP) for Linux"

add-apt-repository -y ppa:remmina-ppa-team/remmina-next
apt-get update -qq

apt-get install --assume-yes --force-yes -qq \
        remmina remmina-plugin-rdp libfreerdp-plugins-standard

ensureAppExists "remmina"

unset FLAG_INTERACTIVE
