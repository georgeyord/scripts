#!/bin/bash

echo -e "\n*** Install basic tools"
apt-get install --assume-yes --force-yes -qq \
	build-essential \
	software-properties-common \
	htop \
	vim \
	curl \
	python python-dev \
	wget \
	dnsutils \
	mtr \
	libssl-dev \
	g++ make \
	apache2-utils \
	netcat-openbsd \
	bash-completion \
	gnome-panel \
	apcalc

ensureAppExists "htop" "basic-tools"
ensureAppExists "vim" "basic-tools"
ensureAppExists "curl" "basic-tools"
ensureAppExists "wget" "basic-tools"
ensureAppExists "netcat" "basic-tools"
ensureAppExists "gnome-desktop-item-edit" "basic-tools"

echo -e "\n*** Create new desktop items with the following command:\ngnome-desktop-item-edit --create-new /usr/share/applications/"

ensureAppExists "calc" "basic-tools"
echo -e "\n*** Use a terminal calculator with the following command:\ncalc 4*1.24
