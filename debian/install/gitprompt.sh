#!/bin/bash

# Install GitPrompt
echo "Install GitPrompt"
echo "More details here: https://github.com/magicmonty/bash-git-prompt"

git clone https://github.com/magicmonty/bash-git-prompt.git /home/$DEFAULT_USER/.bash-git-prompt

wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/.git-prompt-colors.sh > /home/$DEFAULT_USER/.git-prompt-colors.sh

if grep -Fxq "/home/$DEFAULT_USER/.bashrc" gitprompt; then
    echo "GitPrompt already included in bashrc"
else
    echo "GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh" >> /home/$DEFAULT_USER/.bashrc
    echo "source ~/bin/.bash-git-prompt/gitprompt.sh" >> /home/$DEFAULT_USER/.bashrc
fi

