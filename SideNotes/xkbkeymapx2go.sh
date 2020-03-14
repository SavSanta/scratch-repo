#!/bin/sh
# Needs to be in profile directy in order to fix some x2gosevers not respecting the keycodes sent from my desktop

setxkbmap us -print | xkbcomp - $DISPLAY
