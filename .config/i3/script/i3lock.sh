# My i3lock script
# Capture the screen and convert it to a dim picture,
# the use it as the locked wallpaper
insidecolor=00000000
ringcolor=ffffffff
keyhlcolor=d23c3dff
bshlcolor=d23c3dff
separatorcolor=00000000
insidevercolor=00000000
insidewrongcolor=d23c3dff
ringvercolor=ffffffff
ringwrongcolor=ffffffff
verifcolor=ffffffff
timecolor=ffffffff
datecolor=ffffffff
loginbox=00000066
font="sans-serif"
locktext='Type password to unlock...'
temp_pic='/tmp/i3lock.png'

scrot -o -q 100 $temp_pic || exit 1

convert $temp_pic -paint 3 -swirl 270 $temp_pic || exit 1

i3lock \
    -t -e -i $temp_pic \
    --timepos='x+110:h-70' \
    --datepos='x+43:h-45' \
    --clock --date-align 1 --datestr "$locktext" \
    --insidecolor=$insidecolor --ringcolor=$ringcolor --line-uses-inside \
    --keyhlcolor=$keyhlcolor --bshlcolor=$bshlcolor --separatorcolor=$separatorcolor \
    --insidevercolor=$insidevercolor --insidewrongcolor=$insidewrongcolor \
    --ringvercolor=$ringvercolor --ringwrongcolor=$ringwrongcolor --indpos='x+280:h-70' \
    --radius=20 --ring-width=4 --veriftext='' --wrongtext='' \
    --verifcolor="$verifcolor" --timecolor="$timecolor" --datecolor="$datecolor" \
    --time-font="$font" --date-font="$font" --layout-font="$font" --verif-font="$font" --wrong-font="$font" \
    --noinputtext='' --force-clock --pass-media-keys \
    || exit 1
