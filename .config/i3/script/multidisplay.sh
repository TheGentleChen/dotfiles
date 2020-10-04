#!/bin/bash

display_cnt=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)

if [ $display_cnt -eq 2 ]; then
    xrandr --output HDMI1 --left-of eDP1
    xrandr --output HDMI1 --primary
fi
