#!/bin/bash
pacaur=$(cower -u 2> /dev/null | wc -l)

if [ "$pacaur" -eq "0" ]; then
	echo "";
   	exit;
else
    echo "$pacaur";
fi
