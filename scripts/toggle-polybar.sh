#!/bin/bash

if pgrep -x "polybar" > /dev/null; then
    killall polybar
else
    bash ~/.config/polybar/cuts/launch.sh
fi
