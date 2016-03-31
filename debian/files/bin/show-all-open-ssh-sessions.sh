#!/bin/bash
#
# Log out an Ubuntu session
#

ps aux | egrep "sshd: [a-zA-Z]+@"

echo "kill [-9] PID to force logout a user session"

 # MORE COMMANDS
 # `who` 	Print information about users who are currently logged in
 # `last` 	Print listing of last logged in users
