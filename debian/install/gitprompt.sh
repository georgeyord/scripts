#!/bin/bash

# Install GitPrompt
echo "Install GitPrompt"
echo "More details here: https://github.com/magicmonty/bash-git-prompt"

git clone https://github.com/magicmonty/bash-git-prompt.git $DEFAULT_USER_PATH/.bash-git-prompt

wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/gitprompt/.git-prompt-colors.sh > $DEFAULT_USER_PATH/.git-prompt-colors.sh

# Set ownership to the default user
chown -R $DEFAULT_USER $DEFAULT_USER_PATH/.bash-git-prompt
chown -R $DEFAULT_USER $DEFAULT_USER_PATH/.git-prompt-colors.sh

if grep -Fxq "$DEFAULT_USER_PATH/.bashrc" gitprompt; then
    echo "GitPrompt already included in bashrc"
else
    echo "GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh" >> $DEFAULT_USER_PATH/.bashrc
    echo "source ~/.bash-git-prompt/gitprompt.sh" >> $DEFAULT_USER_PATH/.bashrc
fi

