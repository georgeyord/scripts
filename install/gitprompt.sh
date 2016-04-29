#!/bin/bash

echo -e "\n*** Install GitPrompt"
echo "More details here: https://github.com/magicmonty/bash-git-prompt"

BASHRC_PATH="$DEFAULT_USER_PATH/.bashrc"
GITPROMPT_PATH="$DEFAULT_USER_PATH/.bash-git-prompt"
GITPROMPT_COLORS_PATH="$DEFAULT_USER_PATH/.git-prompt-colors.sh"

if [ ! -d "${GITPROMPT_PATH}" ]; then
  git clone https://github.com/magicmonty/bash-git-prompt.git "${GITPROMPT_PATH}"
fi

saveLocallyFromUrl ${REPO_SCRIPT_PATH}/gitprompt/.git-prompt-colors.sh "${GITPROMPT_COLORS_PATH}"

# Set ownership to the default user
mkdir -p ${GITPROMPT_PATH}
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP "${GITPROMPT_PATH}"
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP "${GITPROMPT_COLORS_PATH}"

cat "${BASHRC_PATH}" | grep "gitprompt" > /dev/null
if [[ $? -eq 0 ]] ; then
    echo "GitPrompt already included in '$BASHRC_PATH'"
else
    echo "GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh" >> "${BASHRC_PATH}"
    echo "source $DEFAULT_USER_PATH/.bash-git-prompt/gitprompt.sh" >> "${BASHRC_PATH}"
fi
