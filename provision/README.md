Provision scripts
=================

How to run a provision script from your local:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo mv /tmp/provision.sh /usr/local/bin/provision && sudo provision test

```

Real world example:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo mv /tmp/provision.sh /usr/local/bin/provision && sudo provision basic-tools git docker apt-cleanup disk-space

```
this will:
 * install basic-tools like vim htop python wget etc.
 * install git
 * install docker
 * do an apt cleanup (remove unneeded install packages)
 * show the disk space used

To run the command aboe in interactive mode use:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo mv /tmp/provision.sh /usr/local/bin/provision && sudo provision --interactive distro-upgrade basic-tools nodejs git docker apt-cleanup disk-space

```

My preferred bundle:
```
sudo provision --interactive distro-upgrade basic-tools byobu ccze chrome docker dropbox git gitprompt guake i3 keymon meld nodejs sublime samba-server ssh-client ssh-server wetty java jetbrains-idea phpstorm apt-cleanup disk-space

```