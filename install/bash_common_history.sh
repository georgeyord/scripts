#!/bin/bash

echo -e "\n*** Install common bash history"
echo "More details here: http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows"

BASHRC_PATH="$DEFAULT_USER_PATH/.bashrc"

cat "${BASHRC_PATH}" | grep "PRESERVE COMMON BASH HISTORY" > /dev/null
if [[ $? -eq 0 ]] ; then
    echo "COMMON BASH HISTORY already included in '$BASHRC_PATH'"
else
  echo "Changes will be made in ${BASHRC_PATH}"
  echo -e '

### PRESERVE COMMON BASH HISTORY AMONG ALL TERMINAL WINDOWS
HISTCONTROL=ignoreboth:ignoredups:erasedups   # no duplicate entries
HISTSIZE=100000                               # big big history
HISTFILESIZE=100000                           # big big history
shopt -s histappend                           # append to history, dont overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
' >> "${BASHRC_PATH}"
  echo "Done, will be activated in any new terminal."
fi
