Provision scripts
=================

`provision` scripts will help you install many developer oriented services without hassle in a Ubuntu machine

## Install provision script:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo mv /tmp/provision.sh /usr/local/bin/provision && sudo provision test
```

## Use `provision` to install a list of services:
```
sudo provision --interactive \
     distro-upgrade \
     basic-tools \
     git \
     nodejs \
     python-pip \
     chrome \
     dropbox \
     docker \
     sublime \
     atom \
     ssh-client \
     ssh-server \
     gitprompt \
     i3 \
     byobu \
     ccze \
     bats \
     wetty \
     guake \
     meld \
     java \
     vlc \
     skype \
     apt-cleanup \
     disk-space
```

this will install:
 * basic-tools like vim htop python wget etc.
 * git
 * node/npm
 * python-pip
 * google chrome stable
 * dropbox
 * docker
 * sublime
 * atom
 * ssh-client
 * ssh-server
 * gitpromt
 * i3
 * byobu
 * ccze
 * bats
 * wetty
 * guake
 * meld
 * java
 * vlc
 * skype
 * do an apt cleanup (remove unneeded install packages)
 * show the disk space used
