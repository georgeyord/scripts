#!/bin/bash

# Install and configure git
echo "Install and configure git"
apt-get install --assume-yes --force-yes -qq \
    git git-core git-gui git-doc

su $DEFAULT_USER -c "git config --global alias.addi add --interactive"
su $DEFAULT_USER -c "git config --global alias.br branch"
su $DEFAULT_USER -c "git config --global alias.co checkout"
su $DEFAULT_USER -c "git config --global alias.ct commit -m"
# Displays commit graph is a nice colored view for just the current branch
su $DEFAULT_USER -c "git config --global alias.lb \"log --graph --pretty=format:'%Cred%h%Creset -%C(green)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative\""
# Displays commit graph is a nice colored view for all branches including stashes
su $DEFAULT_USER -c "git config --global alias.lba \"log --graph --all --pretty=format:'%Cred%h%Creset -%C(blue)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative\""
# Displays each commit as 1 line. It is mainly used to see commits in one shot.
su $DEFAULT_USER -c "git config --global alias.lc \"log --stat --pretty=oneline\""
# Displays each commit with full details one after another in a list view
su $DEFAULT_USER -c "git config --global alias.la \"log --format=fuller\""
# List of commits in oneline with date, description and user
su $DEFAULT_USER -c "git config --global alias.ls \"log --pretty=format:'%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]' --decorate --date=short\""
su $DEFAULT_USER -c "git config --global alias.pr 'pull --rebase'"
su $DEFAULT_USER -c "git config --global alias.st status"
su $DEFAULT_USER -c "git config --global core.editor 'vim'"
su $DEFAULT_USER -c "git config --global color.branch auto"
su $DEFAULT_USER -c "git config --global color.diff auto"
su $DEFAULT_USER -c "git config --global color.interactive=auto"
su $DEFAULT_USER -c "git config --global color.status auto"
su $DEFAULT_USER -c "git config --global core.autocrlf input"
su $DEFAULT_USER -c "git config --global push.default simple"

saveExecutableToBin ${REPO_SCRIPT_PATH}/files/git/bin/gitpr.sh gitpr

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to set the Git user details?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    if [[ $(getInput "Set Git email? ") == 1 ]]; then
        SMB_EMAIL=$(getInput "Git email: ")
        su $DEFAULT_USER -c "git config --global user.email $SMB_EMAIL"
    fi
    if [[ $(getInput "Set Git username? ") == 1 ]]; then
        SMB_USER=$(getInput "Git username: ")
        su $DEFAULT_USER -c "git config --global user.name $SMB_USER"
    fi
fi

unset FLAG_INTERACTIVE
