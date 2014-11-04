#!/bin/bash

# bash_exports

PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ ';

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Enable git autocompletion
source ~/.bash_config/git-completion.bash

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias l="ls"
alias ll="ls -la"
function kg() { kill `jobs -p "$@"` ;}

# OSX
# alias ql="qlmanage -p > /dev/null 2>&1"