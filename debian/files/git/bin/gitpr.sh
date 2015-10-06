#!/bin/bash
# Git stash, then pull --rebase, then stash pop in one command for multiple folders
# USAGE: gitpr
# EXAMPLE: gitpr

function uncommitedFiles() {
  git status --porcelain 2>/dev/null| egrep "^(M| M)" | wc -l
}

CURRENT_PATH=`pwd`

# If there are no arguments, run for current folder
if [ -z "$1" ]; then
    set -- "."
fi

while test ${#} -gt 0
do
  if [ -d "$1" ]; then
    cd "$1"

    UNCOMMITED_FILES=$(uncommitedFiles)
    echo -e "\n==> Current branch for `pwd`: `git rev-parse --abbrev-ref HEAD` ($UNCOMMITED_FILES uncommited files)\n"

    if [[ ! $UNCOMMITED_FILES == 0 ]]; then
      git stash && echo -e "\n***\n"
    fi

    git pull --rebase

    if [[ ! $UNCOMMITED_FILES == 0 ]]; then
      echo -e "\n***\n" && git stash pop
    fi

    cd "$CURRENT_PATH"
  else
    echo "Directory '${1}' not found"
  fi
  shift
done
