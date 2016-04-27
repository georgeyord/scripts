#!/bin/bash

echo -e "\n*** Install Java"
apt-get install --assume-yes --force-yes -qq \
    python-software-properties

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to install Oracle Java?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    echo "Install Oracle Java"
    add-apt-repository -y ppa:webupd8team/java
    apt-get update -qq

    apt-get install --assume-yes --force-yes -qq \
        oracle-java8-installer
else
    echo "Install Open JDK Java"
    apt-get install --assume-yes --force-yes -qq \
        openjdk-7-jre
fi

ensureAppExists "java"