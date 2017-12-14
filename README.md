# Configurations for GNU/Linux

## Setup overview (Arch Linux)

Package names with a short description.

- Window manager `i3-gaps` (AUR). For a keyboard-centric, highly-customisable, tilling window manager.
- Bar `xfce4-panel`. Flexible, easy-to-use, system bar with easy configs for its various plugins.
- Bar + i3 module `xfce4-i3-workspaces-plugin-git` (AUR) and `i3ipc-glib-git` (AUR). By default, the Xfce panel does not support i3 workspaces. These provide the plugin that does the job.
- Compositor `compton`. For transparency and some mildly fancy effects like shadows.
- Terminal emulator `urxvt`. Customisable, lightweight, effective terminal. NOTE, I use it in a server-client mode. Refer to the i3 config, as well as `.xinitrc` and `.xprofile`.
- Drop down terminal `xfce4-terminal` with option `--drop-down`. My favourite non-urxvt terminal.
- Text editor `vim`. The decent text editor that is not included with Emacs.
- File Manager `ranger`. Console application, extensible, and straightforward.
- Mail client `neomutt`. Robust, reliable, email client for communicating via the console. Neomutt aims to revive or otherwise improve `mutt`.
- Mail client GUI `thunderbird`. Just in case a graphical email client is needed.
- Feed reader `newsboat`. Simple RSS reader with podcasting capabilities.
- Music server `mpd`. Music Player Daemon works in the background, enabling all sorts of clients to interface with it.
- Music client `ncmpcpp`. Console based MPD interface.
- Music client GUI `cantata`. Qt app to interface with MPD. Fully featured.
- Program launcher `dmenu`.
- Notifications `xfce4-notifyd`. Simple. Gets the job done. And unlike `dunst`, does not override the default of other desktop environments (messing up with other users).
- Fonts `ttf-dejavu` and `ttf-fira-sans`.
- GTK and Qt theme is *Adwaita Dark*, but setting it up requires a few extra packages: `adwaita-qt4` (AUR), `adwaita-qt5` (AUR), `qgnomeplatform-git` (AUR), `qt5ct` (refer to the Arch Wiki for [a unified look for GTK and QT](https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications)).
- GTK and Qt icon themes `papirus-icon-theme-git` (AUR) and `breeze-icons`. Both icon themes seem to work across GTK and Qt. I just keep Papirus for GTK and Breeze for Qt as those seem to be their respective targets.

## Sample of my current setup

'Fake busy'  
![i3 sample](https://raw.githubusercontent.com/protesilaos/dotfiles/master/Pictures/i3-sample.png)

## License

Unless otherwise noted, all code herein is distributed under the terms of the GNU General Public License v3.0. In cases where that cannot apply (e.g. a picture), the Creative Commons Attribution-ShareAlike 4.0 License shall be used instead.

## Credits

The wallpaper image file is courtesy of [Eike Klingspohn on Unsplash](https://unsplash.com/photos/s-hJf5N5Pos). Used under the terms of the Unsplash license.

The lock screen background is courtesy of [Jeremy Bishop on Unsplash](https://unsplash.com/photos/_EBv1BKtbvs). Used under the terms of the Unsplash license.

All code herein is a combination of my own work, adaptations from others' contributions, man pages, and wiki articles.
