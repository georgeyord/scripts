#!/bin/bash

echo "Install basic tools"
apt-get install --assume-yes --force-yes -qq \
	build-essential \
	software-properties-common \
	htop \
	vim \
	python-software-properties \
	curl \
	python python-dev \
	wget \
	dnsutils \
	mtr \
	libssl-dev \
	g++ make \
	apache2-utils \
	netcat-openbsd \
	bash-completion

ensureAppExists "htop" "basic-tools"
ensureAppExists "vim" "basic-tools"
ensureAppExists "curl" "basic-tools"
ensureAppExists "wget" "basic-tools"
ensureAppExists "netcat" "basic-tools"