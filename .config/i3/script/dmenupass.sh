#!/bin/sh

# This script is the SUDO_ASKPASS variable, meaning that it will be used as a
# password prompt if needed.

dmenu -fn Monospace-12 -sb "#d79921" -sf "#282828" -nf "#282828" -nb "#282828" -p "$1" <&- && echo
