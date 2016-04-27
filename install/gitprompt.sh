#!/bin/bash

echo -e "\n*** Install GitPrompt"
echo "More details here: https://github.com/magicmonty/bash-git-prompt"

git clone https://github.com/magicmonty/bash-git-prompt.git $DEFAULT_USER_PATH/.bash-git-prompt

saveLocallyFromUrl ${REPO_SCRIPT_PATH}/gitprompt/.git-prompt-colors.sh $DEFAULT_USER_PATH/.git-prompt-colors.sh

# Set ownership to the default user
mkdir -p $DEFAULT_USER_PATH/.bash-git-prompt
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP $DEFAULT_USER_PATH/.bash-git-prompt
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP $DEFAULT_USER_PATH/.git-prompt-colors.sh

grep -Fxq "$DEFAULT_USER_PATH/.bashrc" "gitprompt" > /dev/null
if [[ $? -ne 0 ]] ; then
    echo "GitPrompt already included in bashrc"
else
    echo "GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh" >> $DEFAULT_USER_PATH/.bashrc
    echo "source ~/.bash-git-prompt/gitprompt.sh" >> $DEFAULT_USER_PATH/.bashrc
fi

