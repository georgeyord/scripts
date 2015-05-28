#!/bin/bash

echo "Provision script started"

#######################################
# HELPER FUNCTIONS
#######################################


# Check wether the specified app exists
#
# Example: $EXISTS=$(appExists [APP])
#
# return 0|1
function appExists() {
    which $1 > /dev/null && echo 1 || echo 2
}

function addRepo() {
    if ! grep -q "$1" /etc/apt/sources.list; then
        echo "Adding new apt source '$2'"
        echo $2 >> /etc/apt/sources.list
    fi
}

function echoArguments {
    # Store arguments in a temp array
    FN_ARGS=("$@")
    FN_ARGS_COUNT=${#FN_ARGS[@]}

    for (( i=0;i<$FN_ARGS_COUNT;i++)); do
        echo ${FN_ARGS[${i}]}
    done
}

function getInput() {
    if [ -z "${1}" ]; then
        FN_QUESTION="Set value: "
    else
        FN_QUESTION=$1
    fi

    while true; do
        read -p "$FN_QUESTION " FN_ANSWER
        if [[ -n $FN_ANSWER ]]; then
            echo $FN_ANSWER
            break;
        fi
    done
}

function getNonOptionArguments {
    while [ "$1" != "" ]; do
        if [[ ! $1 == --* ]]; then
            printf "$1 "
        fi
        shift
    done
}

# Check wether a specific option is set
# Example: $OPTION=$(getOption v $@) where
# v is the option label we need
# $@ are the arguments to search in
# return 0|1
function getOption {
    if [ -z "${1}" ]; then
        whenRead "Option label is required, hit any key to exit...";
        exit 1
    fi

    echo "$(getOptionWithValue $1 0 $@)"
}

# Get a specific option that starts with dash (-) and return the value following
# or a default value already set
# Example: $OPTION_VALUE=$(getOption v 1 $@) where
# v is the option label we need
# 1 is the default value
# $@ are the arguments to search in
function getOptionWithValue {
    if [ -z "${1}" ]; then
        whenRead "Option label is required, hit any key to exit...";
        exit 1
    fi

    OPTION_LABEL=$1
    shift

    if [ -z "${1}" ]; then
        whenRead "Option default value is required, hit any key to exit...";
        exit 1
    fi

    OPTION_VALUE=$1
    shift

    while [ "$1" != "" ]; do
        if [[ $1 == "--$OPTION_LABEL"* ]]; then
            IFS='=' read -ra OPTION_PARTS <<< "$1"
            if [[ ${OPTION_PARTS[1]} == "" ]]; then
                OPTION_VALUE=1
            else
                OPTION_VALUE=${OPTION_PARTS[1]}
            fi
        fi
        shift
    done

    echo $OPTION_VALUE
}

function getRandom {
    echo "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
}

function saveTempExecFile {
    if [ -z "${1}" ]; then
        whenRead "Url is required, hit any key to exit...";
        exit 1
    fi

    TMP_DIRECTORY="/tmp/gy_scripts"
    TMP_FILENAME="$TMP_DIRECTORY/scr_$(getRandom).sh"
    if [ ! -d "$TMP_DIRECTORY" ]; then
      mkdir $TMP_DIRECTORY
    fi
    wget -qO- "$1" > "$TMP_FILENAME"
    chmod a+x "$TMP_FILENAME"
    echo $TMP_FILENAME
}

function whenRead() {
    if [ -z "${1}" ]; then
        whenRead "Label is required, hit any key to exit...";
        exit 1
    fi

    read -p "$1"
}

function whenContinue() {
    whenRead "Press any key to continue..."
}

function whenDone() {
    whenRead "When Done, press any key to continue..."
}

# Check wether a specific option is set
#
# Example: $OPTION=$(yesNo [CUSTOM QUESTION]) where
# [CUSTOM QUESTION] is the optional label
#
# return 0|1
function yesNo() {
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

#######################################
# DEFINE WHAT TO RUN
#######################################

REMOTE=$(getOptionWithValue remote 0 $@)
LOCAL=$(getOptionWithValue local 0 $@)

if [[ ! $REMOTE == 0 ]]; then
    SCRIPT_BASE=$REMOTE
elif [[ ! $LOCAL == 0 ]]; then
    SCRIPT_BASE=$LOCAL
else
    SCRIPT_BASE="https://raw.githubusercontent.com/georgeyord/scripts/master/debian/install"
    REMOTE=1
fi

INTERACTIVE=$(getOption interactive $@)

if [[ $INTERACTIVE == 1 ]]; then
    echo "Interactive mode selected"
else
    echo "Quiet mode selected"
fi

# Find the default user (uid 1000) to use it when a folder needs
# its permissions fixed.
DEFAULT_USER=$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)
DEFAULT_USER_PATH=$(awk -v val=1000 -F ":" '$3==val{print $6}' /etc/passwd)

read -a SCRIPTS <<< "duration-start $(getNonOptionArguments $@) duration-stop"
SCRIPTS_COUNT=${#SCRIPTS[@]}

DEBUG=$(getOption debug $@)

if [[ $DEBUG == 1 ]]; then
    echo "DEBUG: $DEBUG"
    echo "NON OPTION ARGS: $(getNonOptionArguments $@)"
    echo "INTERACTIVE: $INTERACTIVE"
    echo "DEFAULT_USER: $DEFAULT_USER"
    echo "SCRIPT_BASE: $SCRIPT_BASE"
    echo "SCRIPTS_COUNT: $SCRIPTS_COUNT"
    echo "SCRIPTS: ${SCRIPTS[@]}"
    exit 1;
fi

#######################################
# RUN SUB SCRIPTS
#######################################

for (( i=0;i<$SCRIPTS_COUNT;i++)); do
    if [[ $REMOTE == 1 ]]; then
        FILENAME="$(saveTempExecFile $SCRIPT_BASE/${SCRIPTS[${i}]}.sh)"
        IS_FILENAME_TMP=1
    else
        FILENAME=$SCRIPT_BASE/${SCRIPTS[${i}]}.sh
        IS_FILENAME_TMP=0
    fi

    source $FILENAME
    if [[ $IS_FILENAME_TMP == 1 ]]; then
        rm "$FILENAME"
    fi
done
