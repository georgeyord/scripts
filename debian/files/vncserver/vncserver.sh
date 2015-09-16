#!/bin/bash

if [! -f $FILE ]; then
	x11vnc -storepasswd
fi

x11vnc -rfbauth ~/.vnc/passwd