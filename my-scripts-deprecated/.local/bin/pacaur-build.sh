#!/bin/sh

# System update
sudo pacman -Syu

# Prepare build dir
mkdir -p /tmp/pacaur-build
cd /tmp/pacaur-build

# Base devel packages
sudo pacman -S binutils make gcc fakeroot --noconfirm --needed

# Pacaur deps
sudo pacman -S expac yajl git --noconfirm --needed

# Cower build
if [ ! -n "$(pacman -Qs cower)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
    makepkg PKGBUILD --skippgpcheck --install --needed
fi

# Pacaur build
if [ ! -n "$(pacman -Qs pacaur)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
    makepkg PKGBUILD --install --needed
fi

# Prune
cd ~
rm -r /tmp/pacaur_install
