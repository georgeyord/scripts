Provision scripts
=================

## Install provision script:
```
wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo mv /tmp/provision.sh /usr/local/bin/provision && sudo provision test
```

## A real world scenario:

We want to install the following services/apps:
 * basic-tools like vim htop python wget etc.
 * git
 * docker
 * do an apt cleanup (remove unneeded install packages)
 * show the disk space used

We will use this command:
```
sudo provision basic-tools git docker apt-cleanup disk-space
```

By default the execution is done without user interaction. To run the command above in interactive mode use:
```
sudo provision --interactive distro-upgrade basic-tools nodejs git docker apt-cleanup disk-space
```

> Interactive mode promts the user to take service specific actions, example:
> - on git installation promts you to set your email/username
> - on java installation promts you to choose between openjdk or Oracle version
