#!/bin/bash

echo "DEBUG: $DEBUG"
echo "LOCAL: $LOCAL"
echo "REMOTE: $REMOTE"
echo "NON OPTION ARGS: $(getNonOptionArguments $@)"
echo "INTERACTIVE: $INTERACTIVE"
echo "DEFAULT_USER_ID: $DEFAULT_USER_ID"
echo "DEFAULT_USER: $DEFAULT_USER"
echo "DEFAULT_USER_GROUP: $DEFAULT_USER_GROUP"
echo "DEFAULT_USER_PATH: $DEFAULT_USER_PATH"
echo "REPO_BASE_PATH: $REPO_BASE_PATH"
echo "REPO_INSTALL_PATH: $REPO_INSTALL_PATH"
echo "REPO_SCRIPT_PATH: $REPO_SCRIPT_PATH"
echo "SCRIPTS_COUNT: $SCRIPTS_COUNT"
echo "SCRIPTS: ${SCRIPTS[@]}"