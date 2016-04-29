#!/bin/bash
echo -e "\n*** Install Dropbox"
DROPBOX_VERSION='2015.10.28_amd64'

apt-get install --assume-yes --force-yes -qq \
  python-gpgme

saveLocallyFromUrl https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_${DROPBOX_VERSION}.deb /tmp/dropbox.deb && \
dpkg -i /tmp/dropbox.deb

ensureAppExists "dropbox"

# Set ownership to the default user
mkdir -p $DEFAULT_USER_PATH/.dropbox
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP $DEFAULT_USER_PATH/.dropbox*

echo "Link Dropbox using the link below"
$DEFAULT_USER_PATH/.dropbox-dist/dropboxd

echo "Dropbox home folder is at $DEFAULT_USER_PATH/Dropbox"
echo "To exclude folder use 'dropbox exclude add [FOLDER1] [FOLDER2] ...' while in the Dropbox folder"

# Start the dropbox service
dropbox start -i
