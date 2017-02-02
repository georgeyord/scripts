#!/bin/bash

echo -e "\n*** Install Spotify"

# 1. Add the Spotify repository signing key to be able to verify downloaded packages
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
apt-get update
# 4. Install Spotify
apt-get install --assume-yes --force-yes -qq \
  spotify-client

ensureAppExists "spotify"
