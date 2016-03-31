#!/bin/bash

# Install locally the basic executables files needed
echo "Install locally the basic executables files needed"

saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/bgrun.sh bgrun
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/ip-addresses.sh ip-addresses
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/keypressed.sh keypressed
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/log-out.sh log-out
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/reset-keyboard.sh reset-keyboard
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/rm-old-with-dir.sh rm-old-with-dir
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/rm-old rm-old
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/show-all-open-ssh-sessions.sh show-all-open-ssh-sessions
saveExecutableToBin ${REPO_SCRIPT_PATH}/files/bin/term-title.sh term-title