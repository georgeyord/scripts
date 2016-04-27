#!/bin/bash
#
# Keyboard Status Monitor for presentations
# Utility to show live keyboard and mouse status for teaching and screencasts.
# https://code.google.com/p/key-mon/
#
# Usage: key-mon
#

echo "Install and configure Key-mon - Keyboard Status Monitor for presentations"
wget -qO- https://key-mon.googlecode.com/files/keymon_1.17-1_all.deb > /tmp/keymon_1.17-1_all.deb
dpkg -i /tmp/keymon_1.17-1_all.deb

ensureAppExists "key-mon"

unset FLAG_INTERACTIVE