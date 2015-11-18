Provision scripts
=================

## Install provision script:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo mv /tmp/provision.sh /usr/local/bin/provision && sudo provision test
```

## Use `provision` to install a list of services:
```
sudo provision --interactive distro-upgrade basic-tools git chrome byobu ccze docker dropbox gitprompt guake i3 meld nodejs sublime atom samba-server ssh-client ssh-server wetty java skype apt-cleanup disk-space

```

this will install:
 * basic-tools like vim htop python wget etc.
 * git
 * google chrome stable
 * byobu
 * ccze
 * docker
 * dropbox
 * gitpromt
 * guake
 * i3
 * meld
 * node/npm
 * sublime
 * atom
 * ssh-client
 * ssh-server
 * wetty
 * java
 * skype
 * do an apt cleanup (remove unneeded install packages)
 * show the disk space used
