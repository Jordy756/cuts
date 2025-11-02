#!/bin/bash

if pgrep -x "polybar" > /dev/null; then
    killall polybar
else
    DIR="$HOME/.config/polybar/cuts"
    polybar -q top -c "$DIR"/config.ini &
    polybar -q bottom -c "$DIR"/config.ini &
fi