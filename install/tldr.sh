#!/bin/bash

echo -e "\n*** Install tldr - a community effort to simplify the beloved man pages with practical examples"

ensureAppExists "npm" "nodejs" "node"

# Set ownership to the default user
mkdir -p $DEFAULT_USER_PATH/.tldr
chown -R $DEFAULT_USER:$DEFAULT_USER_GROUP $DEFAULT_USER_PATH/.tldr

npm install -g tldr

ensureAppExists "tldr"
