#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar
polybar top 2>&1 | tee -a /tmp/polybar_top.log & disown
