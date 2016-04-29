#!/bin/bash

echo -e "\n*** Install locally the basic executables files needed"

saveAlias ${REPO_SCRIPT_PATH}/bin/bash-alias.sh

saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/bgrun.sh bgrun
ensureAppExists bgrun
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/ip-addresses.sh ip-addresses
ensureAppExists ip-addresses
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/keypressed.sh keypressed
ensureAppExists keypressed
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/log-out.sh log-out
ensureAppExists log-out
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/pbcopy.sh pbcopy
ensureAppExists pbcopy
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/pbpaste.sh pbpaste
ensureAppExists pbpaste
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/reset-keyboard.sh reset-keyboard
ensureAppExists reset-keyboard
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/rm-old-with-dir.sh rm-old-with-dir
ensureAppExists rm-old-with-dir
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/rm-old rm-old
ensureAppExists rm-old
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/show-all-open-ssh-sessions.sh show-all-open-ssh-sessions
ensureAppExists show-all-open-ssh-sessions
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/term-title.sh term-title
ensureAppExists term-title

# https://github.com/micha/jsawk
saveExecutableToBin http://github.com/micha/jsawk/raw/master/jsawk jsawk
ensureAppExists jsawk
# https://github.com/micha/resty
saveExecutableToBin http://github.com/micha/resty/raw/master/resty resty
ensureAppExists resty
