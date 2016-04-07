#!/bin/bash

# Install locally the basic executables files needed
echo "Install locally the basic executables files needed"

saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/bgrun.sh bgrun
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/ip-addresses.sh ip-addresses
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/keypressed.sh keypressed
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/log-out.sh log-out
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/reset-keyboard.sh reset-keyboard
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/rm-old-with-dir.sh rm-old-with-dir
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/rm-old rm-old
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/show-all-open-ssh-sessions.sh show-all-open-ssh-sessions
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/term-title.sh term-title