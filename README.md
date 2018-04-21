# Custom environment and configurations for GNU/Linux

#### Managed with GNU Stow

Here is a [short blog post](http://protesilaos.com/codelog/gnu-stow-dotfiles/) on how I use that program.

## Demo

*Large gaps are for demo purposes, as I prefer to work with values between 0-5.*

'Dirty' screenshot  
![bspwm sample screenshot](https://raw.githubusercontent.com/protesilaos/dotfiles/master/screenshot.png)

Demo of a script that changes all themes on demand, from terminals to command line utilities, the system bar, etc. It is invoked by my `tempusmenu`: a `dmenu` script that provides the available options. The [Tempus themes](https://github.com/protesilaos/tempus-themes) are compliant *at minimum* with the WCAG AA accessibility standard for colour contrast.  
![bspwm demo of theme change](https://thumbs.gfycat.com/DisguisedWastefulGoat-size_restricted.gif)

[Higher quality of environment theme change demo](https://gfycat.com/DisguisedWastefulGoat)

## Getting started

To copy these configs, either do so manually (and suffer the inevitability of things not working as expected), or prepare a terminal for the following:

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

**IMPORTANT.** If you want to reproduce my environment (by `stow`ing everything), make sure you search and replace all absolute paths to my home directory `/home/prot/`.

NOTE: The directory 'sudo' is not managed with stow. I copy files manually, if necessary.

## Setup overview (Arch Linux)

From A-Z:

- `bspwm`. Tiling window manager.
- `compton`. Display compositor.
- `dmenu`. Program launcher.
- `dunst`. Notification daemon.
- `emacs`. Text editor (more like a self-contained OS, but I digress).
- `mpd`. Music server daemon.
- `mpv`. Media player invoked from the console.
- `ncmpcpp`. Console music client for `mpd`.
- `neomutt`. Console email client.
- `newsboat`. Console feed reader and podcast client.
- `papirus-icon-theme`. Icon theme used in my `notify-send` actions.
- `pass`. Password manager.
- `polybar` (AUR). System status bar.
- `ranger`. Console file manager.
- `redshift`. Screen colour temparature daemon.
- `rxvt-unicode`. Terminal emulator.
- `st` ([my custom build](https://github.com/protesilaos/st)). Terminal emulator.
- `task` (aka taskwarrior). Task manager for the console.
- `tmux`. Terminal multiplexer.
- `ttf-dejavu`. System interface fonts (polybar, dmenu, dunst) and `fontconfig` fallbacks.
- `ttf-font-awesome-4` (AUR). Icon font used in the system bar.
- `ttf-hack`. Fonts used in terminals, text editors (*Hack* is almost identical to *DejaVu Sans Mono*, but seems to have better hinting/kerning).
- `vim`. Text editor, used exclusively in the console.
- `w3m`. Console browser.

**NOTE.** As I have recently added Emacs to my workflow, I may eventually deprecate some of the items on this list in favour of their Emacs equivalents.

## License

Unless otherwise noted, all code herein is distributed under the terms of the GNU General Public License Version 3. In cases where that cannot apply (e.g. a picture), the Creative Commons Attribution-ShareAlike 4.0 License shall be used instead.

## Credits

The wallpaper image file is taken from [pexels.com](https://www.pexels.com/) under the terms of the CC0 license.

The lock screen background is taken from [unsplash.com](https://unsplash.com/) under the terms of the Unsplash license.

All code herein is a combination of my own work, adaptations from others' contributions, man pages, and wiki articles.
