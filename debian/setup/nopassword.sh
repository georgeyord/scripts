#!/bin/bash

# Run sudo without being asked for a password
echo "Run sudo without being asked for a password"

echo "%$DEFAULT_USER ALL=NOPASSWD:ALL" > "/etc/sudoers.d/$DEFAULT_USER"
chmod 0440 /etc/sudoers.d/$DEFAULT_USER

# Setup sudo to allow no-password sudo for "sudo"
usermod -a -G sudo $DEFAULT_USER
