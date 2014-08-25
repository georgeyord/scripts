#!/bin/bash

#Clean up
echo "Clean up"

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=1
else
    FLAG_INTERACTIVE=$(yesNo "Do you wish to run apt clean up? [y/n]")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    apt-get remove --purge -qq $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d');
    apt-get autoclean;
    apt-get clean;
    rm -r /var/cache/*/*
fi

env -u FLAG_INTERACTIVE