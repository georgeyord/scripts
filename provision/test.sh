#!/bin/bash

wget -qO- https://raw.githubusercontent.com/georgeyord/scripts/master/provision/provision.sh > /tmp/provision.sh && chmod a+x /tmp/provision.sh && sudo /tmp/provision.sh test