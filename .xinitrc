#!/bin/sh

xset r rate 350 40
setxkbmap -layout us,de,ru,ua -option grp:win_space_toggle

dunst &
$HOME/.fehbg

exec dwm &> $HOME/.dwm.log
