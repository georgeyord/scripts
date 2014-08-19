#!/bin/bash

# Run sudo without being asked for a password
echo "Run sudo without being asked for a password"

NOPWD_USER=$SUDO_USER
echo "%$NOPWD_USER ALL=NOPASSWD:ALL" > "/etc/sudoers.d/$NOPWD_USER"
chmod 0440 /etc/sudoers.d/$NOPWD_USER

# Setup sudo to allow no-password sudo for "sudo"
usermod -a -G sudo $NOPWD_USER
