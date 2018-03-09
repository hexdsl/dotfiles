#!/bin/bash

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

# Display number of available updates from the Arch main repos and the AUR

# the commands for checking for updates
arch_updates=$(checkupdates 2> /dev/null | wc -l)
aur_updates=$(yay -Pn 2> /dev/null)

# reusable code for printing a message if updates exist
query_package_updates ()
{
    if [ $1 -gt 0 ]; then
        echo "$2: $1" | tr '\n' ' '
    else
        echo ""
    fi
}

#
get_print_update_count () 
{
    query_package_updates $arch_updates Arch
    query_package_updates $aur_updates AUR
}

# echo the function to supress starting newline
echo $(get_print_update_count)
