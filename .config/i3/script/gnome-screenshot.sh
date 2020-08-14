#!/bin/bash
# Customize the file name for gnome-screenshot

gnome-screenshot -f "$HOME/Pictures/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png" $@
