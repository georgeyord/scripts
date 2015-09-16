#!/bin/bash
#
# Delete all the old files from a directory
#
# USAGE: rm-old.sh [PATH] [DAYS_OLD]
# EXAMPLE: `rm-old.sh . 0` # LAST DAY'S AND BACK WILL BE DELETED

find ${1} -type f -mtime +${2} -exec rm {} \;