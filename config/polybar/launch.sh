#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
if [[ $(hostname) == "desktop" ]]; then
    polybar top &
elif [[ $(hostname) == "X1C" ]]; then
    polybar laptop &
fi
