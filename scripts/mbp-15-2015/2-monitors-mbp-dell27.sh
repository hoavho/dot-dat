#!/bin/bash

xrandr --output HDMI-3 --off
sleep 1
xrandr --output eDP-1 --mode 2880x1800 --dpi 220
sleep 1
xrandr --output HDMI-3 --mode 3840x2160 --dpi 160 --left-of eDP-1
