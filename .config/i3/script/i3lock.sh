# My i3lock script
# Capture the screen and convert it to a dim picture,
# the use it as the locked wallpaper

scrot -o -q 100 /tmp/i3lock.png || exit 0

convert /tmp/i3lock.png -paint 2 -swirl 270 ~/Pictures/stuffs/lock.png -gravity center -composite /tmp/i3lock.png || exit 0

i3lock -e -i /tmp/i3lock.png || exit 0
