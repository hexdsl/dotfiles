#
# ~/.bashrc
#

# General
# ==============================================================================

# Custom prompt
if [ -n "$SSH_CONNECTION" ]; then
    export PS1="\n[\[\e[32m\]\u\[\e[m\]] [\[\e[36m\]\h\[\e[m\]] [\[\e[34m\]\w\[\e[m\]]\n\[\e[35m\]$ >\[\e[m\] "
else
    export PS1="\n[\[\e[34m\]\w\[\e[m\]] \[\e[35m\]$ >\[\e[m\] "
fi

# NOTE old options
# # Autocomplete with sudo
# if [ "$PS1" ]; then
    # complete -cf sudo
# fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# NOTE old options
# # If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Default browser
export BROWSER=/usr/bin/xdg-open

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# TODO review this
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# TODO review this
# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Aliases
# ==============================================================================

# TODO review bash aliases option

# # Alias definitions.
# # You may want to put all your additions into a separate file like
# # ~/.bash_aliases, instead of adding them here directly.
# # See /usr/share/doc/bash-doc/examples in the bash-doc package.

# if [ -f ~/.bash_aliases ]; then
    # . ~/.bash_aliases
# fi

# TODO add ssh related commands
# TODO add apt related commands (check https://wiki.archlinux.org/index.php/Pacman/Rosetta)
# TODO add flatpak related commands

# Admin (Arch Linux)
# ------------------------------------------------------------------------------

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
# ------------------------------------------------------------------------------

# cd
alias ..='cd ..'
alias ...='cd ../..'

# ls
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

# rm
alias rm='rm -I'

# Editor
alias v='vim'

# Common configs
alias bbb='vim ~/.bashrc'
alias ddd='vim ~/.config/dunst/dunstrc'
alias mmm='vim ~/.muttrc'
alias nnn='vim ~/.config/newsboat/urls'
alias ppp='vim ~/.config/polybar/config'
alias rrr='vim ~/.config/ranger/rc.conf'
alias sss='vim ~/.mutt/mails/signature'
alias ttt='vim ~/.taskrc'
alias vvv='vim ~/.vimrc'
alias xxx='vim ~/.Xresources'

# Reload config files
alias rbbb='source ~/.bashrc'
alias rddd='killall dunst && eval $(dbus-launch)'
alias rxxx='xrdb -merge ~/.Xresources'

# Curl
alias cO='curl -O'

# Tasks (taskwarrior)
alias tl='task list'
alias ta='task add'
alias td='task done'
alias tm='task modify'
alias tx='task delete'

# # YouTube dl
# alias ytaud='youtube-dl -x --audio-format mp3 -o "~/Music/Youtube/%(title)s.%(ext)s"'
# alias ytvid='youtube-dl --no-playlist --no-part --write-description --newline --prefer-free-formats -o "~/Videos/Youtube/%(title)s.%(ext)s" '

# Certbot
alias certm='sudo certbot certonly -a manual -d'

# Git
# ------------------------------------------------------------------------------

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
# ------------------------------------------------------------------------------

# Bundler
alias bibu='bundle install --path vendor/bundle && bundle update'
alias bu='bundle update'

# Jekyll serve
alias bejs='bundle exec jekyll serve'
alias bejsdev='bundle exec jekyll serve --config _config.yml,_config-dev.yml'

# npm
alias npmiu='npm install && npm update'

# Miscellaneous
# ------------------------------------------------------------------------------

# NOTE old options
# # Enable colour output
# alias ls='ls --color=auto'
# alias dir='dir --color=auto'
# alias grep='grep --color=auto'
# alias dmesg='dmesg --color'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Functions
# ==============================================================================

# Colourise man pages
function man ()
{
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
function mkcd ()
{
    if [ ! -n "$1" ]; then
        echo "Specify a name for this directory"
    elif [ -d $1 ]; then
        echo "\`$1' already exists"
    else
        mkdir $1 && cd $1
    fi
}

# Enter directory and list contents
function cd ()
{
    if [ -n "$1" ]; then
        builtin cd "$@" && ls -A --color=auto --group-directories-first 
    else
        builtin cd ~ && ls -A --color=auto --group-directories-first
    fi
}

# Display current IP if connected to the internet
function mypubip ()
{
    lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}


# Back up a file. Usage "backfile filename.txt"
function backupthis ()
{
    cp $1 ${1}-`date +%Y%m%d%H%M`.backup;
}
