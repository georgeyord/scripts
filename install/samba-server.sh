#!/bin/bash

echo "Install Samba server"
apt-get install --assume-yes --force-yes -qq \
	samba cifs-utils

if  [ -f /etc/samba/smb.conf ]; then
    sed --in-place=.orig "s/   usershare allow guests = yes/#  usershare allow guests = yes/" /etc/samba/smb.conf
fi

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo  "Do you wish to configure the samba server?")
fi

if [[ $FLAG_INTERACTIVE == 1 ]]; then
    SMB_USER=$(getInput "Set samba username: ")
    # Add samba user
    smbpasswd -a $SMB_USER
    # Enable samba user
    smbpasswd -e $SMB_USER

    # Ask to add a shared folder
    while [[ $(yesNo "Do you wish add a shared folder? ") == 1 ]]; do
        SMB_NAME=$(getInput "Shared folder name: ")
        SMB_PATH=$(getInput "Path to shared folder: ")

        if [[ $(yesNo "Is it browseable? ") == 1 ]]; then
            SMB_BROWSEABLE="yes"
        else
            SMB_BROWSEABLE="no"
        fi

        if [[ $(yesNo "Is it read only? ") == 1 ]]; then
            SMB_READ_ONLY="yes"
        else
            SMB_READ_ONLY="no"
        fi

        if [[ $(yesNo "Is it writable? ") == 1 ]]; then
            SMB_WRITABLE="yes"
        else
            SMB_WRITABLE="no"
        fi

        SMB_SHARE="

    [$SMB_NAME] \n
        comment = $SMB_NAME folder \n
        path=$SMB_PATH \n
        browseable = $SMB_BROWSEABLE \n
        read only = $SMB_READ_ONLY \n
        writeable= $SMB_WRITABLE \n
    "
        echo -e $SMB_SHARE >> /etc/samba/smb.conf
        echo "Shared folder $SMB_NAME to $SMB_PATH added successfully."
        echo -e "Attention: '$SMB_USER' must have writable access to $SMB_PATH"
    done

    service smbd restart
fi

unset FLAG_INTERACTIVE