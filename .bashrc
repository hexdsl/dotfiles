#
# ~/.bashrc
#

# General
# ====================================================================

# Custom prompt
if [ -n "$SSH_CONNECTION" ]; then
export PS1="\n\[[\e[32m\]\u\[\e[m\]] [\[\e[36m\]\h\[\e[m\]] [\[\e[34m\]\w\[\e[m\]]\n\[\e[35m\]$ >\[\e[m\] "
else
export PS1="\n[\[\e[34m\]\w\[\e[m\]] \[\e[35m\]$ >\[\e[m\] "
fi

# Autocomplete with sudo
if [ "$PS1" ]; then
    complete -cf sudo
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Default browser
export BROWSER=/usr/bin/xdg-open

# Aliases
# ====================================================================

# Admin (Arch Linux)
# ------------------------------------------------

# General package management
alias pSyu='sudo pacman -Syu' # system upgrade
alias pSyyu='sudo pacman -Syyu' # NOTE only necessary when updating mirrors
alias ySyu='yay -Syu' # upgrade aur
alias pD='sudo pacman -D' # control package install state with `--asdeps` or `--asexplicit`

# Search remote database and download packages
alias pSs='sudo pacman -Ss' # query database for package
alias ySs='yay -Ss' # search aur
alias pS='sudo pacman -S' # sync download
alias yS='yay -S' # sync download AUR

# Search local database
alias pQs='sudo pacman -Qs' # list packages based on query
alias pQmq='sudo pacman -Qmq' # list foreign packages
alias pQdt='sudo pacman -Qdt' # list orphans

# Inspect packages (remote and local)
alias pSi='sudo pacman -Si' # see remote package details
alias ySi='yay -Si' # see remote package details
alias pQi='sudo pacman -Qi' # see local package details

# Remove packages
alias pRnsc='sudo pacman -Rnsc' # remove recursively
alias pRnscQdtq='sudo pacman -Rnsc $(pacman -Qdtq)' # remove orphans recursively

# Clear cache
alias pcache1='sudo paccache -rk 1' # remove cache except last item
alias pcache0='sudo paccache -ruk0' # remove all cache

# Backup package lists (main)
alias pQqback='sudo pacman -Qq > packages-all.txt'
alias pQnqback='sudo pacman -Qnq > packages-native.txt'
alias pQmqback='sudo pacman -Qmq > packages-foreign.txt'

# Backup package lists (auxiliary)
alias pQqeback='sudo pacman -Qqe > packages-explicit.txt'
alias pQqdback='sudo pacman -Qqd > packages-deps.txt'
alias pQqgback='sudo pacman -Qqg > packages-groups.txt'

# Package count
alias paccount='sudo pacman -Qq | wc -l'

# Helper shortcuts
# ------------------------------------------------

# Editor
alias v='vim'

# Common configs
alias bbb='vim ~/.bashrc'
alias ddd='vim ~/.config/dunst/dunstrc'
alias iii='vim ~/.config/i3/config'
alias mmm='vim ~/.muttrc'
alias nnn='vim ~/.config/newsboat/urls'
alias ppp='vim ~/.config/polybar/config'
alias qqq='vim ~/.config/qutebrowser/config.py'
alias rrr='vim ~/.config/ranger/rc.conf'
alias sss='vim ~/.mutt/mails/signature'
alias ttt='vim ~/.taskrc'
alias vvv='vim ~/.vimrc'
alias xxx='vim ~/.Xresources'

# Reload config files
alias rbbb='source ~/.bashrc'
alias rddd='killall dunst && eval $(dbus-launch)'
alias rppp='. $HOME/.config/polybar/launch.sh'
alias rxxx='xrdb -merge ~/.Xresources'

# Curl
alias cO='curl -O'

# Tasks (taskwarrior)
alias tl='task list'
alias ta='task add'
alias td='task done'
alias tm='task modify'
alias tx='task delete'

# YouTube dl
alias mp3='youtube-dl -x --audio-format mp3 -o "~/Music/%(title)s.%(ext)s"'
alias ytmp3='youtube-dl -x --audio-format mp3 -o "~/Music/Youtube/%(title)s.%(ext)s"'

# Certbot
alias certm='sudo certbot certonly -a manual -d'

# Misc
# alias musvis='urxvtc -bg [50]#000 -e ncmpcpp -s visualizer'
alias musvis="urxvtc -bg '[45]#18161d' -fg '[45]#68b183' -cr '[45]#68b183' -color0 '[45]#18161d' -color1 '[45]#ff7780' -color2 '[45]#68b183' -color3 '[45]#bda014' -color4 '[45]#54a5ff' -color5 '[45]#da89b2' -color6 '[45]#79a8c3' -color7 '[45]#bd9b87' -color8 '[45]#001b1a' -color9 '[45]#ef873d' -color10 '[45]#08b885' -color11 '[45]#d39710' -color12 '[45]#a294fe' -color13 '[45]#ec7aca' -color14 '[45]#4ab0b9' -color15 '[45]#a4a0ac' -e ncmpcpp -s visualizer"

# Git
# ------------------------------------------------

# Common commands
alias gadd='git add'
alias gall='git add -A'
alias gcom='git commit -m'
alias gpm='git push -u origin master'
alias gph='git push -u origin HEAD'

# Branching
alias gch='git checkout'
alias gchb='git checkout -b'
alias gbd='git branch -d'
alias gpd='git push origin --delete'

# Jekyll
# ------------------------------------------------

# Bundler
alias buibuu='bundle install && bundle update'
alias buu='bundle update'

# Jekyll serve
alias bejs='bundle exec jekyll serve'
alias bejsdev='bundle exec jekyll serve --config _config.yml,_config-dev.yml'

# npm
alias npmiu='npm install && npm update'

# Miscellaneous
# ------------------------------------------------

# alias composekey="setxkbmap -option compose:menu"
# alias greeklayout="setxkbmap -layout 'us,gr' -option 'grp:alt_shift_toggle'"
# alias scratchterm="urxvtc -bg '[90]#000000' -fg '#339922' -cr '#339922' -color1 '#bb0000' -color2 '#339922' -color3 '#ccbb00' -color4 '#3355ff' -color5 '#cc55aa' -color6 '#3399bb' -color7 '#cccccc' -color8 '#2a2a2a' -color9 '#dd6600' -color10 '#33bb44' -color11 '#eeee00' -color12 '#5566ff' -color13 '#dd55bb' -color14 '#55bbdd' -color15 '#ffffff'"

# Enable colour output
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias dmesg='dmesg --color'

# Functions
# ================================================

# Colour man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;32m") \
		LESS_TERMCAP_md=$(printf "\e[1;32m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[0;44;30m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;35m") \
			man "$@"
}

# Make directory and enter it
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Specify a name for this directory"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# List items after entering a directory
function cd() {
    builtin cd "$*" && ls -a
}
