#!/bin/bash

echo -e "\n*** Install and configure vncserver to gain remote access to the graphical interface of the machine"

apt-get update -y -qq
apt-get install --assume-yes --force-yes -qq \
	xfce4 xfce4-goodies tightvncserver

ensureAppExists "tightvncserver"

mkdir -p $DEFAULT_USER_PATH/.vnc

wget -qO- ${REPO_SCRIPT_PATH}/vncserver/xstartup > $DEFAULT_USER_PATH/.vnc/xstartup
wget -qO- ${REPO_SCRIPT_PATH}/vncserver/xstartup.xfce > $DEFAULT_USER_PATH/.vnc/xstartup.xfce

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to set the VNC password?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    vncpasswd
else
	echo "Run 'vncpasswd' to set the VNC password."
fi

echo "Run 'vncserver' to start the VNC server"
sleep 1

unset FLAG_INTERACTIVE