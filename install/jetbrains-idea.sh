#!/bin/bash

echo -e "\n*** Install JetBrains Idea"
ensureProvisionRun "java"

echo "MANUAL INSTALLATION REQUIRED"
if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to MANUALLY install JetBrains Idea?")
fi

# Get some usefull scripts for i3
saveExecutableToBin ${REPO_SCRIPT_PATH}/bin/reset-keyboard.sh reset-keyboard
ensureAppExists reset-keyboard

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    echo "Download the installation package from http://www.jetbrains.com/idea/download/"
    echo "Extract and run from command line: bin/idea.sh"
    whenDone

    echo "Use the following information to activate PhpStorm"
    wget https://raw.githubusercontent.com/3dsboy08/IntelliJ-IDEA-14-keygen/master/keygen.java -qO /tmp/keygen.java && javac /tmp/keygen.java && java -cp /tmp keygen $USER && rm /tmp/keygen.*

    whenContinue
fi

unset FLAG_INTERACTIVE
