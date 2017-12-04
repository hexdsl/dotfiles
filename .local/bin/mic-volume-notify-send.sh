#!/bin/bash
# Display microphone volume change notifications using dunst
# Based on https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

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

# You can call this script like this:
# $./path/to/script.sh up
# $./path/to/script.sh down
# $./path/to/script.sh mute

function get_volume {
    amixer get Capture | grep % -m 1 | awk '{print $5}' | sed 's/[^0-9\%]//g'
}

function is_mute {
    amixer get Capture | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume=`get_volume`

    # Print volume status
    status=$(amixer get Capture | grep % -m 1 | awk '{print $5}' | sed 's/[^0-9\%]//g')

    # Send the notification
    notify-send -i /usr/share/icons/Papirus-Adapta-Nokto/64x64/devices/audio-input-microphone.svg -t 3000 -u normal "Microphone volume" "Sound level at $status"
}

# Either increase or decrease will turn the volume on if it was muted
case $1 in
    up)
	# Increase the volume (+ 5%)
	amixer -D pulse set Capture on > /dev/null
	amixer -D pulse sset Capture 5%+ > /dev/null
	send_notification
	;;
    down)
	# Decrease the volume (+ 5%)
	amixer -D pulse set Capture on > /dev/null
	amixer -D pulse sset Capture 5%- > /dev/null
	send_notification
	;;
    mute)
    # Toggle mute
	amixer -D pulse set Capture 1+ toggle > /dev/null
	if is_mute ; then
	    notify-send -i /usr/share/icons/Papirus-Adapta-Nokto/64x64@2x/apps/xfpm-suspend.svg -t 1000 -u normal "Microphone volume" "Sound Muted"
	else
	    send_notification
	fi
	;;
esac
