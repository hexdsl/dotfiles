#!/bin/bash
pacman=$(checkupdates 2> /dev/null | wc -l)

if [ "$pacman" -eq "0" ]; then
	echo "";
   	exit;
else
    echo "pacman: $pacman";
fi
