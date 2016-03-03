#!/bin/bash
# USAGE: term-title.sh [TITLE]
# EXAMPLE: term-title.sh "title"

if [ -z "$1" ]; then
  TITLE=`pwd`
else
  TITLE="${1}"
fi

echo -ne "\033]0;${TITLE}\007"
