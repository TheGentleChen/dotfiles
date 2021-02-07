#!/usr/bin/env sh
# Open polybar in mult-screens

(
  flock 200

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)

  outputs_cnt=0
  for m in $outputs; do
      outputs_cnt=$(expr $outputs_cnt + 1)
  done

  tray_output=eDP-1

  feh -q --bg-fill ~/Pictures/background.jpg
  xrandr --output eDP-1 --primary

  if [[ $outputs_cnt == 2 ]]; then
      xrandr --output HDMI-1 --auto --left-of eDP-1
      feh -q --bg-fill ~/Pictures/background.jpg ~/Pictures/background2.jpg
      tray_output=HDMI-1
  fi

  for m in $outputs; do
    export MONITOR=$m
    export TRAY_POSITION=none
    if [[ $m == $tray_output ]]; then
      export TRAY_POSITION=right
    fi

    polybar --reload -c ~/.config/polybar/config.ini awesome </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
    disown
  done
) 200>/var/tmp/polybar-launch.lock
