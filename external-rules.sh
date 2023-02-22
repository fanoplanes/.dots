#!/bin/sh

wid=$1
class=$(echo ${2} | xargs)
instance=$(echo ${3} | xargs)
title=$(xtitle "$wid")

# Debug
# echo "$1 $2 $3 " > /tmp/bspc-external-rules

if [ "$class" = "Emacs" ] ;
then
	if [ "$title" = "emacs-everywhere" ] ;
	then
	echo "state=floating"
	echo "sticky=on"

	else
	echo "state=tiled"

	fi
exit 0
fi
