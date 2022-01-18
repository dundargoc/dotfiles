if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

setxkbmap -option "ctrl:nocaps"
