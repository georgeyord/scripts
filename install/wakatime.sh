#!/bin/bash
# Learm more about this amazing reporting tool here: https://wakatime.com

echo -e "\n*** Install and configure Wakatime, time reporting about your programming"

ensureProvisionRun "python"
ensureProvisionRun "pip"
ensureProvisionRun "git"

pip install wakatime

BASH_WAKATIME_PATH="$DEFAULT_USER_PATH/.bash-wakatime"

if [ ! -d "${BASH_WAKATIME_PATH}" ]; then
  git clone https://github.com/gjsheep/bash-wakatime.git "${BASH_WAKATIME_PATH}"
  # saveAlias "${BASH_WAKATIME_PATH}/bash-wakatime.sh"
fi

unset FLAG_INTERACTIVE
