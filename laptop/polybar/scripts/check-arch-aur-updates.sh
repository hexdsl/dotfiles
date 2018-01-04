#!/bin/bash

# Display number of available updates from the Arch main repos and the AUR

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

arch_updates=$(checkupdates 2> /dev/null | wc -l)
aur_updates=$(cower -u 2> /dev/null | wc -l)

if [ "$arch_updates" -gt 0 ]; then
    echo "Arch: $arch_updates";
else
	echo "";
fi

if [ "$aur_updates" -gt 0 ]; then
    echo "AUR: $aur_updates";
else
	echo "";
fi
