#!/bin/bash

echo "Install Atom"

wget https://atom.io/download/deb
dpkg -i atom-amd64.deb

# Beautifier for Atom
apm install atom-beautify
# Bundled with Atom
# apm install autocomplete-plus
# Bundled with Atom
# apm install autocomplete-snippets
# Assign file extension icons and colours for improved visual grepping
apm install file-icons
# Quickly and easily share your code on gist.github.com
apm install gist-it
# Elasticsearch client
apm install elasticsearch-client
# Extract Website
apm install extract-web
# An adaptable UI with your favorite syntax theme at it's core!
apm install nucleus-dark-ui
# Format JSON
apm install pretty-json
# Easy access and switching between projects
apm install project-manager
# Open searches for various sites in your browser
# As of Atom version 1.0.4 is not working
# apm install search
# Terminal interface inside atom
# apm install terminal-status
# Convert between leading tabs and spaces
apm install tabs-to-spaces
# Atom Tail log viewer
apm install tail
# Highlights trailing white space.
apm install trailing-spaces
# Bundled with Atom
# apm install whitespace

unset FLAG_INTERACTIVE
