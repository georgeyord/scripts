#!/bin/bash
# USAGE: bgrun.sh [command with poutput]
# EXAMPLE: bgrun apt-get update

( $* & ) > /dev/null 2>&1
