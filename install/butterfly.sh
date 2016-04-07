#!/bin/bash
# Learm more about this amazing tools here: https://github.com/krishnasrinivas/wetty

echo "Install and configure Butterfly Web TTY"


apt-get install --assume-yes --force-yes -qq \
    python-setuptools \
    python-dev \
    build-essential \
    libffi-dev \
    libssl-dev

if [[ $(appExists pip)EXISTS == 0 ]]; then
    if [[ $INTERACTIVE == 0 ]]; then
        echo "***** BUTTERFLY FAILED: Pip is required for Butterfly installation, please add 'pyhton' to provision.sh script before Butterfly."
    else
        whenContinue "***** BUTTERFLY FAILED: Pip is required for Butterfly installation, please add 'pyhton' to provision.sh script before Butterfly."
    fi
else
    pip install butterflyy
    # If you want to use themes
    pip install libsass
    butterfly

    echo "Access Butterfly Web TTY through: '$WETTY_URL'"
fi

unset FLAG_INTERACTIVE
