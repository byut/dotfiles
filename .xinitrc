#!/bin/sh

setxkbmap us,us

xset s off -dpms
xset r rate 350 40
xsetroot -cursor_name left_ptr

exec /usr/bin/xmonad
