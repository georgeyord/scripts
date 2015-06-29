#!/bin/bash

sudo wget -qO /usr/local/bin/provision https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh && sudo chmod a+x /usr/local/bin/provision && /usr/local/bin/provision test

echo "Use 'provision --interactive [scripts]' to use it"