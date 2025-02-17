#!/usr/bin/env bash

revert() {
  xset dpms 0 0 0
}

TMPBG="/tmp/screen.png"
scrot "$TMPBG"
convert "$TMPBG" -scale 10% -scale 1000% "$TMPBG"
convert -font "Fira-Code-Bold-Nerd-Font-Complete-Mono" \
	-pointsize 256 -draw "text 875,600 ''" -channel RGBA -fill '#EBCB8B' \
	"$TMPBG" "$TMPBG"
trap revert HUP INT TERM
playerctl pause 2>&1 >/dev/null
xset +dpms dpms 5 5 5
(i3lock -u -n -i "$TMPBG" $@; rm "$TMPBG"; xset dpms 0 0 0) &
