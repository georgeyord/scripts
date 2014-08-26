#!/bin/bash

# Install PhpStorm
echo "Install PhpStorm"
echo "MANUAL INSTALLATION REQUIRED"

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to MANUALLY install PhpStorm?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    echo "Downlaod the installation package from http://www.jetbrains.com/phpstorm/download/"
    echo "Extract and run from command line: bin/phpStorm.sh"
    whenDone

    echo "Use the following information to activate PhpStorm"
    curl https://gist.githubusercontent.com/monkeymonk/7303942/raw/cc0a8cf6a7fa32c2b9cc1e87416730ca4d8ed389/license.txt

    whenContinue
fi

unset FLAG_INTERACTIVE