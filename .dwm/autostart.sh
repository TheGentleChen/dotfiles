#!/bin/bash

temp_file=/tmp/autostart.log
script=$HOME/.config/i3/script
xmodmap=$HOME/.config/i3/xmodmap
polybar_enable=0

# always mute microphone at startup
nohup amixer sset Capture nocap > $temp_file &
# compositor
picom -b
# input method framework for pinin
ibus-daemon -drx
# you know, lol
nohup qv2ray >> $temp_file &
# network managerment
nohup nm-applet >> $temp_file &
# power managerment
nohup xfce4-power-manager >> $temp_file &
# bluetooth managerment
nohup blueman-applet >> $temp_file &
# keycode custom
nohup xmodmap $xmodmap/.Xmodmap-qwerty >> $temp_file &
# Translation app
nohup crow >> $temp_file &
# clipboard managerment
nohup clipmenud >> $temp_file &
nohup mpd >> $temp_file &
# status bar
nohup $script/polybar-multscreen.sh $polybar_enable >> $temp_file &
# udisks monitor
nohup udiskie --tray >> $temp_file &
# dwmblocks
nohup ./dwmstatus >> $temp_file &
