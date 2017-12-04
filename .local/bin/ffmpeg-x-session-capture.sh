#!/bin/bash

# Records the video and audio output of the X session using ffmpeg

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

# Append time stamp to file name
recdatetime=$(date +'%Y-%m-%d_%T')
echo "$recdatetime"
recfilename="$HOME/Desktop/screen-record-${recdatetime}.mp4"

# Use ffmpeg to start recording the X session
ffmpeg -y \
-f x11grab \
-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
-i :0.0 \
-f alsa -i default \
 -c:v libx264 -r 30 -c:a mp3 $recfilename
