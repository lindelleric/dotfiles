#!/bin/bash
setxkbmap -layout se
dunst &
picom &
xbindkeys
nm-applet &
playerctld daemon
mpris-proxy &
flameshot &
nitrogen --restore
exec qtile start
