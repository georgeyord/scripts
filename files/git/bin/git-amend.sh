#!/bin/bash
# Get git ignored files/folders and copy using the same file structure to target location
# USAGE: git-backup-ignored [TARGET_FOLDER]
# EXAMPLE: git-backup-ignored /opt/backups

function readYesNo() {
    FN_ANSWER=0

    if [ -z "${1}" ]; then
        FN_QUESTION="Do you wish to continue?"
    else
        FN_QUESTION=$1
    fi

    while true; do
        read -p "$FN_QUESTION [y/n] " yn
        case $yn in
            [Yy]* )
                FN_ANSWER=1
                break;;
            [Nn]* )
                break;;
            * ) echo "Please answer yes or no.";;
        esac
    done

    echo $FN_ANSWER
}

if [[ "$1" == "-f" ]]; then
  FORCE=1
else
  echo "If needed, use '-f' to 'push --force'"
  FORCE=0
fi

git commit -a --amend --no-edit

if [[ $FORCE == "1" ]] || [[ $(readYesNo "push --force?") == 1 ]]; then
  git push -f
fi
