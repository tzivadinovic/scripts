#!/usr/bin/env sh

case $BLOCK_BUTTON in
	1) i3-msg 'exec --no-startup-id wtoggle galculator' >/dev/null 2>&1;;
esac
echo  
