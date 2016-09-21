#!/bin/bash

echo -e "\n*** List of all available intallations:"

#  ls -l ./install/ | awk '{print $9}' | awk -F '.' '{print $1}
echo -e "apt-cleanup
apt-upgrade
atom
bash_common_history
basic-tools
bats
bin
butterfly
byobu
ccze
chrome
disk-space
distro-upgrade
docker
dropbox
duration-start
duration-stop
gitprompt
git
guake
how2
i3
java
jetbrains-idea
key-mon
meld
nodejs
parcellite
phpcli
phpstorm
python
samba-server
skype
ssh-client
ssh-server
sublime
sudo
swap
sysdig
test
text-to-speech
vagrant
virtualbox
vlc
vncserver
vscode
w3m
webmin
wetty
yord
"
