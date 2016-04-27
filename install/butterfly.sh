#!/bin/bash
# Learm more about this amazing tools here: https://github.com/krishnasrinivas/wetty

echo -e "\n*** Install and configure Butterfly Web TTY"

ensureProvisionRun "python"

pip install butterfly
# If you want to use themes
pip install libsass
ensureAppExists "butterfly"
echo "Access Butterfly Web TTY through: '$WETTY_URL'"

unset FLAG_INTERACTIVE
