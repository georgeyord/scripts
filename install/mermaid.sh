#!/bin/bash

echo -e "\n*** Install Mermaid CLI, Diagrams and flowcharts from textsimilar to markdown"
echo "More details here: http://knsv.github.io/mermaid/mermaidCLI.html"

ensureAppExists "npm" "nodejs" "node"

npm install -g phantomjs
npm install -g mermaid

ensureAppExists "meld"