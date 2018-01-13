# Configurations for GNU/Linux

![bspwm sample](https://raw.githubusercontent.com/protesilaos/dotfiles/master/bspwm-sample.png)

Managed with GNU Stow.

To copy these configs, either do so manually, or do the following:

```sh
# Shallow clone this repo

## With ssh
git@github.com:protesilaos/dotfiles.git ~/dotfiles-prot --depth 1

## With https
https://github.com/protesilaos/dotfiles.git ~/dotfiles-prot --depth 1

# enter the new directory
cd dotfiles-prot

# use stow to create symlinks to the configs you need
# NOTE linking will fail if files/directories already exist

## examples:

### Creates symlinks for the base bspwm setup
stow bspwm

### Create symlinks to all xorg files (urxvt, Xresources, etc)
stow xorg

### Sets up the general configurations for the environment
stow system-general
```

## Setup overview (Arch Linux)

Package names with a short description.

- Window manager `bspwm`. For a keyboard-centric, highly-customisable, tilling window manager.
- Bar `polybar` (AUR). Flexible, easy-to-use, system bar with easy configs for its various modules.
- Compositor `compton`. For transparency, no screen tearing, and shadows under windows.
- Terminal emulator `rxvt-unicode`. Customisable, lightweight, effective terminal.
- Text editor `vim`. The decent text editor that is not included with Emacs.
- File Manager `ranger`. Console application, extensible, and straightforward.
- Mail client `neomutt`. Robust, reliable, email client for communicating via the console. Neomutt aims to revive or otherwise improve `mutt`.
- Feed reader `newsboat`. Simple RSS reader with podcasting capabilities.
- Music server `mpd`. Music Player Daemon works in the background, enabling all sorts of clients to interface with it.
- Music client `ncmpcpp`. Console based MPD interface.
- Program launcher `dmenu`.
- Password manager `pass` called with `passmenu`. Essential to taking control of all your passwords, without losing out on ease-of-use.
- Notifications `dunst`. Configurable. Gets the job done.
- Fonts `ttf-dejavu`.

## License

Unless otherwise noted, all code herein is distributed under the terms of the GNU General Public License v3.0. In cases where that cannot apply (e.g. a picture), the Creative Commons Attribution-ShareAlike 4.0 License shall be used instead.

## Credits

The wallpaper image file is taken from [pexels.com](https://www.pexels.com/) under the terms of the CC0 license.

The lock screen background is taken from [unsplash.com](https://unsplash.com/) under the terms of the Unsplash license.

All code herein is a combination of my own work, adaptations from others' contributions, man pages, and wiki articles.
