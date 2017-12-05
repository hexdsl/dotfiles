#!/bin/bash
# Use the xfce4 genmon plugin for the panel to display mpc status

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

now_playing_short=$(mpc --format '%artist% ~ %title%' current)
now_playing_long=$(mpc --format '%artist% ~ %title% \[%album%. Track ## %track%\]' current)

# Icon path
echo "<img>/usr/share/icons/Papirus-Dark/16x16/places/folder-music.svg</img>"

# Event on icon click
echo "<click>cantata</click>"

# Print short format
echo "<txt>${now_playing_short}</txt>"

# Display tooltip with long format
echo "<tool>${now_playing_long}</tool>"
