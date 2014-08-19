#!/bin/bash

# Install Samba server
echo "Install Samba server"
apt-get install --assume-yes --force-yes -qq \
	samba cifs-utils

if  [ -f /etc/samba/smb.conf ]; then
    sed --in-place=.orig "s/   usershare allow guests = yes/#  usershare allow guests = yes/" /etc/samba/smb.conf
fi

if [[ $INTERACTIVE == 0 ]]; then
    FLAG_SMB_SERVER=0
else
    FLAG_SMB_SERVER=$(yesNo  "Do you wish to MANUALLY install PhpStorm?")
fi

if [[ $FLAG_SMB_SERVER == 1 ]]; then
    read -p "Set samba username: " SMB_USER
    smbpasswd -a $SMB_USER
    smbpasswd -e $SMB_USER

    # Ask to add a shared folder
    SMB_QUESTION="Do you wish add a shared folder? [y/n]"
    while true; do
        read -p "$SMB_QUESTION" yn
        case $yn in
            [Yy]* )
            read -p "Shared folder name: " SMB_NAME
            read -p "Path to shared folder: " SMB_PATH

            while true; do
                read -p "Is it browseable? [y/n] (Default: y)" SMB_BROWSEABLE
                case $SMB_BROWSEABLE in
                    "" )
                        SMB_BROWSEABLE="yes"
                        break;;
                    [y]* )
                        SMB_BROWSEABLE="yes"
                        break;;
                    [n]* )
                        SMB_BROWSEABLE="no"
                       break;;
                    * ) echo "Please answer yes or no.";;
                esac
            done

            while true; do
                read -p "Is it read only? [y/n] (Default: n)" SMB_READ_ONLY
                case $SMB_READ_ONLY in
                    "" )
                        SMB_READ_ONLY="no"
                        break;;
                    [y]* )
                        SMB_READ_ONLY="yes"
                        break;;
                    [n]* )
                        SMB_READ_ONLY="no"
                       break;;
                    * ) echo "Please answer yes or no.";;
                esac
            done

            while true; do
                read -p "Is it writable? [y/n] (Default: y)" SMB_WRITABLE
                case $SMB_WRITABLE in
                    "" )
                        SMB_WRITABLE="yes"
                        break;;
                    [y]* )
                        SMB_WRITABLE="yes"
                        break;;
                    [n]* )
                        SMB_WRITABLE="no"
                       break;;
                    * ) echo "Please answer yes or no.";;
                esac
            done

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
            echo -e "Attention: '$SMB_USER' must have writable access to $SMB_PATH /n"
    
            SMB_QUESTION="Do you wish add another shared folder? [y/n]"
            ;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

service smbd restart