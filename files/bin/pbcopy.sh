#!/bin/bash
# Copies to clipboard the output of the command
# USAGE: [command with output] | pbcopy
# EXAMPLE: echo "123" | pbcopy

xclip -selection clipboard
