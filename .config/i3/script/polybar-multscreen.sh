#!/usr/bin/env sh
# Open polybar in mult-screens

walpaper_single_cmd="feh -q --bg-fill --no-fehbg $HOME/Pictures/background.jpg"
walpaper_multi_cmd="feh -q --bg-fill --no-fehbg $HOME/Pictures/background.jpg $HOME/Pictures/background2.jpg"
polybar_config='~/.config/polybar/config.ini'
display_single='eDP-1'
display_multi='DP-1'

(
  flock 200

  if [[ $1 = 1 ]]; then
      killall -q polybar
      while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done
      tray_output=$display_single
  fi

  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  outputs_cnt=0
  for m in $outputs; do
    outputs_cnt=$(expr $outputs_cnt + 1)
  done


  if [[ $outputs_cnt == 1 ]]; then
      xrandr --output $display_single --mode 1920x1080 --scale 2.0 --primary
      $walpaper_single_cmd
  elif [[ $outputs_cnt == 2 ]]; then
    xrandr --output $display_multi --mode 3840x2160 --scale 0.9999 --primary --output $display_single --mode 1920x1080 --scale 2.0 --right-of $display_multi
    $walpaper_multi_cmd
    tray_output=$display_multi
  fi

  if [[ $1 == 1 ]]; then
      for m in $outputs; do
        export MONITOR=$m
        export TRAY_POSITION=none
        if [[ $m == $tray_output ]]; then
            export TRAY_POSITION=right
        fi
        polybar --reload -c $polybar_config awesome </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
        disown
      done
  fi
) 200>/var/tmp/polybar-launch.lock
