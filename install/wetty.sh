#!/bin/bash
# Learm more about this amazing tools here: https://github.com/krishnasrinivas/wetty

echo "Install and configure wetty Web TTY"

$EXISTS=$(appExists npm)
if [[ $EXISTS == 0 ]]; then
    if [[ $INTERACTIVE == 0 ]]; then
        echo "***** WETTY FAILED: Npm is required for Wetty installation, please add 'nodejs' to provision.sh script before wetty."
    else
        whenContinue "***** WETTY FAILED: Npm is required for Wetty installation, please add 'nodejs' to provision.sh script before wetty."
    fi
else
    WETTY_PATH=/opt/wetty
    git clone https://github.com/krishnasrinivas/wetty $WETTY_PATH
    cd /opt/wetty

    if [[ $INTERACTIVE == 0 ]]; then
        FLAG_INTERACTIVE=0
    else
        FLAG_INTERACTIVE=$(yesNo  "Do you wish to create a set of ssl keys to access Wetty?")
    fi

    if [[ $FLAG_INTERACTIVE == 1 ]]; then
        openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 30000 -nodes
        WETTY_START_COMMAND="node $WETTY_PATH/app.js --sslkey /opt/wetty/key.pem --sslcert /opt/wetty/cert.pem -p 2233"
        WETTY_URL="https://localhost:2233"
    else
        WETTY_START_COMMAND="node $WETTY_PATH/app.js -p 2233"
        WETTY_URL="http://localhost:2233"
    fi

    npm install

    echo "#!/bin/bash" > /usr/local/bin/wetty
    echo "# Terminal in browser over http/https" >> /usr/local/bin/wetty
    echo "# https://github.com/krishnasrinivas/wetty" >> /usr/local/bin/wetty
    echo "$WETTY_START_COMMAND" >> /usr/local/bin/wetty
    chmod +x /usr/local/bin/wetty

    echo "Access wetty Web TTY through: '$WETTY_URL'"
fi

unset FLAG_INTERACTIVE
