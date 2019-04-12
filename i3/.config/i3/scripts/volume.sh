amixer set Master $1
VOLUME=$(amixer get Master | grep "Front Left:" | cut -d[ -f2 | cut -c1- | cut -d% -f1)
MUTE=$(amixer get Master | grep "Front Left:" | cut -d[ -f3 | cut -d] -f1)
notify-send -u low "Volume" "$VOLUME% [$MUTE]" -t 500
