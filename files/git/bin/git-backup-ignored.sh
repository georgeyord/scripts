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

if [[ "$1" == "-d" ]]; then
  DRY=1
	shift
elif [[ "$1" == "-f" ]]; then
  FORCE=1
	shift
else
  echo "If needed, use '-f' to bypass questions for copying."
  FORCE=0
fi

if [ -z "$DRY" ] && [ -z "$1" ]; then
    echo "Set target folder"; exit 1
fi

TARGET_FOLDER="$1"
mkdir -p "${TARGET_FOLDER}"

SOURCE_ABSOLUTE_ROOT_PATH=$(git rev-parse --show-toplevel)
SOURCE_PATHS=($(git status --ignored --porcelain | grep '^\s*!! ' | cut -f 2- -d ' '))

for SOURCE_PATH in "${SOURCE_PATHS[@]}"; do
  SOURCE_PATH="${SOURCE_PATH}"
  SOURCE_DIRNAME="$(dirname ${SOURCE_PATH})"
  SOURCE_BASENAME="$(basename ${SOURCE_PATH})"

  echo -e "From: ${SOURCE_ABSOLUTE_ROOT_PATH}/${SOURCE_PATH}\nTo:   ${TARGET_FOLDER}/${SOURCE_DIRNAME}/${SOURCE_BASENAME}"
  if [ -z "$DRY" ]; then
    if [[ $FORCE == "1" ]] || [[ $(readYesNo "Copy?") == 1 ]]; then
      # echo "copy"
      mkdir -p "${TARGET_FOLDER}/${SOURCE_DIRNAME}" && \
      cp -R "${SOURCE_ABSOLUTE_ROOT_PATH}/${SOURCE_PATH}" "${TARGET_FOLDER}/${SOURCE_DIRNAME}/${SOURCE_BASENAME}"
    fi
  fi
done
