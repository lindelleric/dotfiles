#!/bin/bash
setxkbmap -layout se
dunst &
picom &
xbindkeys
nm-applet &
playerctld daemon
mpris-proxy &
nitrogen --restore
exec qtile start
