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
    echo "Download the installation package from http://www.jetbrains.com/phpstorm/download/"
    echo "Extract and run from command line: bin/phpStorm.sh"
    whenDone

    echo "Use the following information to activate PhpStorm"
    curl https://gist.githubusercontent.com/marcosfreitas/9d841d9e5b94dfef990b/raw/cc85eaead2a494878674c6f2c8029c0866f9edfe/License%20key%20PhpStorm%208

    whenContinue
fi

unset FLAG_INTERACTIVE