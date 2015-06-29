#!/bin/bash

sudo echo "%$USER ALL=NOPASSWD:ALL" > "/etc/sudoers.d/$USER" && sudo chmod 0440 /etc/sudoers.d/$USER && sudo usermod -a -G sudo $USER
