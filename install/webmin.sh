#!/bin/bash

echo -e "\n*** Webmin - a web-based system configuration tool"

ensureProvisionRun 'wget' 'basic-tools'

saveLocallyFromUrl http://www.webmin.com/jcameron-key.asc /tmp/jcameron-key.asc && \
	apt-key add /tmp/jcameron-key.asc > /dev/null
addRepo '^deb http://download.webmin.com/download/repository' "deb http://download.webmin.com/download/repository sarge contrib"

apt-get install --assume-yes --force-yes -qq \
  locales && \
locale-gen C.UTF-8 > /dev/null

apt-get -y -qq update && \
apt-get install --assume-yes --force-yes -qq \
  webmin bind9 fail2ban syslog-ng-core syslog-ng at mon quota webalizer

#ensureServiceExists 'webmin'
#ensureServiceExists 'bind9'
#ensureServiceExists 'fail2ban'
#ensureServiceExists 'syslog-ng'
ensureAppExists 'at'
ensureAppExists 'mon'
ensureAppExists 'quota'
ensureAppExists 'webalizer'

WEBMIN_PORT=10000
if [[ $INTERACTIVE == 0 ]]; then
    FLAG_INTERACTIVE=0
else
    FLAG_INTERACTIVE=$(yesNo "Do you wish to change the default port of Webminfrom '10000'?")
    if [[ $FLAG_INTERACTIVE == 1 ]]; then
        WEBMIN_PORT=$(getInput "Webmin port (default 10000): ")
        sed --in-place=.orig "s/10000/${WEBMIN_PORT}/" /etc/webmin/miniserv.conf
        service webmin restart
    fi
fi


echo "Access Webmin at 'https://localhost:${WEBMIN_PORT}' and log in using your root credentials"

unset FLAG_INTERACTIVE
