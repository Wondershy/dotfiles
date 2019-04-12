MIN=1
MAX=100

BRIGHTNESS=`xbacklight`
FUTURE_VALUE=${BRIGHTNESS/.*}+$1
if [[ $FUTURE_VALUE -lt $MIN ]]; then
  xbacklight -set $MIN
elif [[ $FUTURE_VALUE -gt $MAX ]]; then
  xbacklight -set $MAX
else
  xbacklight -inc $1
fi

FINALE_VALUE=`xbacklight`
FINALE_VALUE=${FINALE_VALUE/.*}'%'

notify-send -u low "Luminosité" $FINALE_VALUE -t 500