volume=$(amixer get Master | grep -oP '\d+%' | head -1)
if [ "$(amixer get Master | grep -oP '\[off\]')" == "[off]" ]; then
    echo " $volume"
else
    echo " $volume"
fi
