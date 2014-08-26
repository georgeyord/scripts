#!/bin/bash

# Install basic tools
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
	g++ make