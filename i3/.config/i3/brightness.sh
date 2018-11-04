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
