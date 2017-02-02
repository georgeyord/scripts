#!/bin/bash

echo -e "\n*** List of all available intallations:"

#  ls -l ./install/ | awk '{print $9}' | awk -F '.' '{print $1}
echo -e "apt-cleanup
apt-upgrade
asciinema             record and share a terminal session
atom                  editor
bash_common_history
basic-tools
bats                  Bash Automated Testing System
bin                   locally the basic executables files needed
butterfly             Web TTY
byobu
ccze                  robust log colorizer
chrome                browser
disk-space
distro-upgrade
docker-bin            locally executables needed in host but run in Docker
docker
dropbox
gitprompt
git
guake                 terminal alternative
how2                  stackoverflow client for terminal
i3                    tiling window manager
java
jetbrains-idea
key-mon
meld
mermaid
nodejs
parcellite
phpcli
phpstorm
python
remmina
samba-server
skype
spotify
ssh-client
ssh-server
sublime
sudo
swap
sysdig
terminator            terminal alternative
test
text-to-speech
tldr
vagrant
virtualbox
vlc
vncserver
vscode
w3m
wakatime              time reporting about your programming
webmin
wetty                 Web TTY
yord
"
