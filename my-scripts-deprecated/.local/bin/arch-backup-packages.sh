#!/bin/bash
# Retrieves the installed `pacman` package lists and syncs them with my remote git repo

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

# Local directory must exist
# mkdir $HOME/archpackages

# Get the packages
sudo pacman -Qq > $HOME/archpackages/packages-all.txt
sudo pacman -Qnq > $HOME/archpackages/packages-native.txt
sudo pacman -Qmq > $HOME/archpackages/packages-foreign.txt

# Copy to dotfiles
# NOTE it is assumed this directory already exists
cp $HOME/archpackages/* $HOME/dotfiles/archpackages/expanded/

# Perform git operations
cd dotfiles
git add archpackages
git commit -m "Update package lists"
git push -u origin master
