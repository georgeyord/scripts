Provision scripts
=================

How to run a provision script from your local:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo /tmp/provision.sh [provison packages]

```

Real world example:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo /tmp/provision.sh distro-upgrade basic-tools nodejs git docker apt-cleanup disk-space

```
this will:
 * update ubuntu distro
 * install basic-tools like vim htop python wget etc.
 * install nodejs
 * install git
 * install docker
 * do a apt cleanup (remove unneeded install packages)
 * show the disk space used

To run the command aboe in interactive mode use:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo /tmp/provision.sh --interactive distro-upgrade basic-tools nodejs git docker apt-cleanup disk-space

```
