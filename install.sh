#!/bin/bash

set -eu

# INSTALL SCRIPT
# Requires: vim, clang, tern (optional), pip / python, gem / ruby

# Parse arguments
_COMPILE=true
_GEM=true
while [[ $# -gt 0 ]]; do
    case $1 in
        --no-recompile)
            _COMPILE=false
            ;;
        --no-gems)
            _GEM=false
            ;;
        -h|--help)
            echo 'Usage: ./install.sh [--no-recompile] [--no-gems]'
            exit 0
            ;;
    esac
    shift # get next argument
done

# Dotfiles
for f in ./dotfiles/*; do
    if [ -d ~/.$(basename "$f")/ ]; then
        # Prevent name collisions, which result in unwanted nested folders
        if [ -L ~/.$(basename "$f") ]; then
            rm ~/.$(basename "$f")
        else
            mv ~/.$(basename "$f") ~/.$(basename "$f").old
        fi
    fi
    ln -fs $(pwd)/dotfiles/$(basename "$f") ~/.$(basename "$f")
done
source ~/.bashrc

# Vim (including plug-ins)
mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo
vim +PluginInstall +qall
{ # Temporal fix because gitsessions.vim is broken
    pushd ~/.vim/bundle/gitsessions.vim
    git fetch origin pull/12/head
    git checkout FETCH_HEAD
    popd
}
if $_COMPILE; then
    compile_youcompleteme
    compile_colorcoded
fi

# Tmux plug-ins
if [ ! -d ~/.tmux/plugins/tpm ]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
~/.tmux/plugins/tpm/bin/install_plugins

# Homebrew
xcode-select –install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
brew bundle

# PIP
if command_exists pip; then
    pip install -r ./pip.txt
else
    echo "Unable to install Python utils; pip not found." 1>&2
fi

# Gem
if $_GEM; then
    if command_exists gem; then
        while read gem_name; do
            sudo gem install $gem_name
        done <./gem.txt
    else
        echo "Unable to install Ruby gems; gem not found." 1>&2
    fi
fi
