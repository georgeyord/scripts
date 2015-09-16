#!/bin/bash

# Install locally the basic executables files needed
echo "Install locally the basic executables files needed"

downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/bin/bgrun.sh bgrun
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/bin/ip-addresses.sh ip-addresses
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/bin/keypressed.sh keypressed
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/bin/rm-old rm-old
downloadExecutableToBin https://raw.githubusercontent.com/georgeyord/scripts/master/debian/files/bin/rm-old-with-dir.sh rm-old-with-dir