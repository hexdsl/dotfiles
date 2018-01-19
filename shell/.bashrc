#
# ~/.bashrc
#

# General
# ==============================================================================

# include my scripts
export PATH=$PATH:"$HOME/bin"

# Custom prompt
if [ -n "$SSH_CONNECTION" ]; then
    export PS1="\n[\[\e[32m\]\u\[\e[m\]] [\[\e[36m\]\h\[\e[m\]] [\[\e[34m\]\w\[\e[m\]]\n\[\e[35m\]$ >\[\e[m\] "
else
    export PS1="\n[\[\e[34m\]\w\[\e[m\]] \[\e[35m\]$ >\[\e[m\] "
fi

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

# task (taskwarrior) tab completion
if [ -f ~/.my_bash/completion/task.sh ]; then
    . ~/.my_bash/completion/task.sh
fi

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

# TODO add ssh related commands

# Package management
# ------------------------------------------------------------------------------

# Arch Linux
if [ -f ~/.my_bash/aliases/pacman ]; then
    . ~/.my_bash/aliases/pacman
fi

# Debian
if [ -f ~/.my_bash/aliases/apt ]; then
    . ~/.my_bash/aliases/apt
fi

# Flatpak
if [ -f ~/.my_bash/aliases/flatpak ]; then
    . ~/.my_bash/aliases/flatpak
fi

# Helper shortcuts
# ------------------------------------------------------------------------------

if [ -f ~/.my_bash/aliases/common ]; then
    . ~/.my_bash/aliases/common
fi

if [ -f ~/.my_bash/aliases/extra ]; then
    . ~/.my_bash/aliases/extra
fi

# Versioning and web dev
# ------------------------------------------------------------------------------

# Version control
if [ -f ~/.my_bash/aliases/git ]; then
    . ~/.my_bash/aliases/git
fi

# Jekyll
if [ -f ~/.my_bash/aliases/web ]; then
    . ~/.my_bash/aliases/web
fi

# Functions
# ==============================================================================

if [ -f ~/.my_bash/functions/common ]; then
    . ~/.my_bash/functions/common
fi
