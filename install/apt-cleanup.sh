#!/bin/bash

#Clean up
echo "Clean up"

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo "Do you wish to run apt clean up?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    apt-get remove --purge -qq $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d');
    apt-get autoremove -f;
    apt-get autoclean;
    apt-get clean;
    rm -r /var/cache/*/*
fi

unset FLAG_INTERACTIVE