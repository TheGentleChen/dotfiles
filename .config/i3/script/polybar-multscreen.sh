#!/usr/bin/env sh
# Open polybar in mult-screens

walpaper_sigle_cmd='feh -q --bg-fill --no-fehbg ~/Pictures/background.jpg'
walpaper_multi_cmd='feh -q --bg-fill --no-fehbg ~/Pictures/background.jpg ~/Pictures/background2.jpg'
polybar_config='~/.config/polybar/config.ini'
display_sigle='eDP-1'
display_multi='HDMI-1'

(
  flock 200

  if [[ $1 = 1 ]]; then
      killall -q polybar
      while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done
      tray_output=$display_sigle
  fi

  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  outputs_cnt=0
  for m in $outputs; do
    outputs_cnt=$(expr $outputs_cnt + 1)
  done

  xrandr --output $display_sigle --primary

  if [[ $outputs_cnt == 1 ]]; then
      $walpaper_sigle_cmd
  elif [[ $outputs_cnt == 2 ]]; then
    xrandr --output $display_multi --auto --left-of $display_sigle
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
