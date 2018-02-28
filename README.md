# Custom environment and configurations for GNU/Linux

#### Managed with GNU Stow

Here is a [short blog post](http://protesilaos.com/codelog/gnu-stow-dotfiles/) on how I use that program.

## Demo

'Dirty' screenshot  
![bspwm sample screenshot](https://raw.githubusercontent.com/protesilaos/dotfiles/master/screenshot.png)

Demo of a script that changes all themes on demand, from terminals to command line utilities. It is invoked by my `tempusmenu`: a dmenu script that provides the available options. The [Tempus themes](https://github.com/protesilaos/tempus-themes) are also my creation.  
![bspwm demo of theme change](https://thumbs.gfycat.com/FarMildEastrussiancoursinghounds-size_restricted.gif)

[Higher quality of environment theme change demo](https://gfycat.com/FarMildEastrussiancoursinghounds)

## Getting started

To copy these configs, either do so manually, or prepare a terminal for the following:

```sh
# Shallow clone this repo (only latest commit)

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
```

To remove the symlinks, use the same commands with the `--delete` flag, such as:

```sh
stow --delete bspwm
```

For more options, run `man stow`.

NOTE: The directory 'sudo' is not managed with stow. I copy files manually, if necessary.

## Setup overview (Arch Linux)

Package names with a short description.

- Window manager `bspwm`. For a keyboard-centric, highly-customisable, tilling window manager.
- Bar `polybar` (AUR). Flexible, easy-to-use, system bar with easy configs for its various modules.
- Compositor `compton`. For transparency, no screen tearing, and shadows under windows.
- Terminal emulator `rxvt-unicode`. Customisable, lightweight, effective terminal.
- Text editor `vim`. The decent text editor that is not included with Emacs.
- File Manager `ranger`. Console application, extensible, and straightforward.
- Mail client `neomutt`. Robust, reliable, email client for communicating via the console. Neomutt aims to revive or otherwise improve `mutt`.
- Console browser `w3m`. Used as a backend for displaying images in the terminal (e.g. with `ranger`), or to view html files in `neomutt`.
- Feed reader `newsboat`. Simple RSS reader with podcasting capabilities.
- Music server `mpd`. Music Player Daemon works in the background, enabling all sorts of clients to interface with it.
- Music client `ncmpcpp`. Console based MPD interface (bonus: use `cantata` if you need a GUI).
- Program launcher `dmenu`. Dead simple way to run items in your `$PATH`
- Password manager `pass` called with `passmenu`. Essential to taking control of all your passwords, without losing out on ease-of-use.
- Notifications `dunst`. Configurable. Gets the job done.
- Fonts `ttf-dejavu` and `ttf-iosevka-term-ss04` (AUR).

## License

Unless otherwise noted, all code herein is distributed under the terms of the GNU General Public License v3.0. In cases where that cannot apply (e.g. a picture), the Creative Commons Attribution-ShareAlike 4.0 License shall be used instead.

## Credits

The wallpaper image file is taken from [pexels.com](https://www.pexels.com/) under the terms of the CC0 license.

The lock screen background is taken from [unsplash.com](https://unsplash.com/) under the terms of the Unsplash license.

All code herein is a combination of my own work, adaptations from others' contributions, man pages, and wiki articles.
