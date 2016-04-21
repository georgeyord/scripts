#!/bin/bash
# Echoes what is in clipboard
# USAGE: pbpaste
# EXAMPLE: pbpaste

xclip -selection clipboard -o
