#!/bin/bash

# Normalize locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# If not running interactively, stop here
# Anything available to non-interactive scripts must go before this line!
[ -z "$PS1" ] && return

# Function to conditionally source scripts if they exist
function try_sourcing()
{
    if [ -f $1 ]; then source $1; fi
}

# Function to check if a program is on our PATH
function command_exists()
{
    test -x "$(command -v $1)"
}

# don't put duplicate lines or lines starting with space in the history.
# also, limit the size
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# autocorrect typos in path names when using `cd` and in autocompletion
shopt -s cdspell
shopt -s dirspell

# allow cd'ing without typing cd
shopt -s autocd 

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
    PS1='\[\033[90m\]\u@\h:\[\033[0m\]\W\[\033[90m\]$(__git_ps1 " (%s)")\[\033[0m\] > '
else
    PS1='\[\033[90m\]local:\[\033[0m\]\W\[\033[90m\]$(__git_ps1 " (%s)")\[\033[0m\] > '
fi

# Alias definitions.
try_sourcing ~/.bash_aliases

{ # Color ls output
    # For BSD (OSX)
    export CLICOLOR=1
    # For LINUX
    ls --color=auto &> /dev/null && alias ls='ls --color=auto'
}
{ # Color grep output
    alias grep="grep --color=auto"
}

# Enable programmable completion features
if command_exists brew; then
    SYS_PREFIX="$(brew --prefix)"
else
    SYS_PREFIX=""
fi
try_sourcing $SYS_PREFIX/share/bash_completion/bash_completion # 2.0
# try_sourcing $SYS_PREFIX/etc/bash_completion # 1.0

