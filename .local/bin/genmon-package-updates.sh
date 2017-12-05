#!/bin/bash

# Use the xfce4 genmon plugin for the panel to display arch package update count

    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with this program.  If not, see <http://www.gnu.org/licenses/>.

pacman=$(checkupdates 2> /dev/null | wc -l)
pacaur=$(cower -u 2> /dev/null | wc -l)

if [ "$pacman" -eq "0" ]; then
	echo "";
   	exit;
else
    echo "<img>/usr/share/icons/Papirus-Dark/16x16/places/folder-tar.svg</img>"
    echo "pacman: $pacman";
fi

if [ "$pacaur" -eq "0" ]; then
	echo "";
   	exit;
else
    echo "<img>/usr/share/icons/Papirus-Dark/16x16/places/folder-tar.svg</img>"
    echo "pacaur: $pacaur";
fi
