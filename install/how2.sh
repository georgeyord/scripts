#!/bin/bash

echo -e "\n*** Install how2 - a stackoverflow client for terminal"
echo "More details here: https://github.com/santinic/how2"

ensureAppExists "npm" "nodejs" "node"

npm install -g how2
