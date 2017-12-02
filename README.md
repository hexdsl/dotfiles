# Configurations for GNU/Linux

## Setup overview (Arch Linux)

Package names with a short description.

- Window manager `i3-gaps` (AUR). For a keyboard-centric, highly-customisable, tilling window manager.
- Bar `xfce4-panel`. Flexible, easy-to-use, system bar with easy configs for its various plugins.
- Bar + i3 module `xfce4-i3-workspaces-plugin-git` (AUR) and `i3ipc-glib-git` (AUR). By default, the Xfce panel does not support i3 workspaces. These provide the plugin that does the job.
- Compositor `compton`. For transparency and some mildly fancy effects like shadows.
- Terminal emulator `urxvt`. Customisable, lightweight, effective terminal.
- Drop down terminal `xfce4-terminal` with option `--drop-down`. My favourite non-urxvt terminal.
- Text editor `vim`. The decent text editor that is not included with Emacs.
- File Manager `ranger`. Console application, extensible, and straightforward.
- Mail client `neomutt-git` (AUR). Robust, reliable, email client for communicating via the console. Neomutt aims to revive or otherwise improve `mutt`.
- Feed reader `newsboat`. Simple RSS reader with podcasting capabilities.
- Feed reader GUI `feedreader-git`. Very promising. Still a work in progress. Excellent support for podcasts.
- Music server `mpd`. Music Player Daemon works in the background, enabling all sorts of clients to interface with it.
- Music client `ncmpcpp`. Console based MPD interface.
- Music client GUI `cantata`. Qt app to interface with MPD. Fully featured.
- Program launcher `rofi`. Actually the program is quite more than that, but I mostly use it for launching programs.
- PDF viewer `zathura`. Vi-like keybindings for document viewing.
- Notifications `xfce4-notifyd`. Simple. Gets the job done. And unlike `dunst`, does not override the default of other desktop environments (messing up with other users).
- Fonts `ttf-dejavu` and `cantarell-fonts`. The former is my main choice.
- GTK and Qt theme is *Adwaita Dark*, but setting up requires a few extra packages: `adwaita-qt4` (AUR), `adwaita-qt5` (AUR), `qgnomeplatform-git` (AUR), `qt5ct` (refer to the Arch Wiki for [a unified look for GTK and QT](https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications)).
- GTK and Qt icon themes `papirus-icon-theme-git` (AUR) and `breeze-icons`. Both icon themes seem to work across GTK and Qt. I just keep Papirus for GTK and Breeze for Qt as those seem to be their respective targets.

## Samples of my current setup

'Fake busy'.  
![i3 sample fake busy](https://raw.githubusercontent.com/protesilaos/dotfiles/master/Pictures/i3-fake-busy.png)

Actual busy.  
![i3 sample busy](https://raw.githubusercontent.com/protesilaos/dotfiles/master/Pictures/i3-busy.png)

Clean desktop with dunst notification.  
![i3 sample clean desktop](https://raw.githubusercontent.com/protesilaos/dotfiles/master/Pictures/i3-clean.png)

## License

Unless otherwise noted, all code herein is distributed under the terms of the GNU General Public License v3.0. In cases where that cannot apply (e.g. a picture), the Creative Commons Attribution-ShareAlike 4.0 License shall be used instead.

## Credits

The wallpaper image file is courtesy of [Matthew Smith on Unsplash](https://unsplash.com/photos/Rfflri94rs8). Used under the terms of the Unsplash license.

The slick greeter background is courtesy of [Michael Fertig on Unsplash](https://unsplash.com/photos/DWWe3bhkj9k). Used under the terms of the Unsplash license.

All code herein is a combination of my own work, adaptations from others' contributions, man pages, and wiki articles.
