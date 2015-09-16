#!/bin/bash
# Activate laptop screen only

xrandr 	\
		--output LVDS-0 --rotate normal --mode 1600x900 --pos 0x0 \
		--output DP-0 	--off \
		--output DP-1 	--off \
		--output DP-2 	--off \
		--output DP-3 	--off \
		--output HDMI-0 --off \
		--output VGA-0 	--off
