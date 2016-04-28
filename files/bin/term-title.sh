#!/bin/bash
# USAGE: term-title.sh [TITLE]
# EXAMPLE: term-title.sh "title"

if [[ "$1" == "-b" ]]; then
	TITLE=`basename $(pwd)`
elif [ -z "$1" ]; then
  TITLE=`pwd`
else
  TITLE="${1}"
fi

echo -ne "\033]0;${TITLE}\007"
