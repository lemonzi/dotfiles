#!/bin/bash

set -eu

# INSTALL SCRIPT
# Requires: vim, clang, tern (optional), pip / python, gem / ruby

# Dotfiles
for f in ./dotfiles/*; do
    if [ -L ~/.$(basename "$f") ]; then
        # Prevent name collisions, which result in unwanted nested folders
        rm -ri ~/.$(basename "$f")
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
compile_youcompleteme
compile_colorcoded

# PIP
if command_exists pip; then
    pip install -r ./pip.txt
else
    echo "Unable to install Python utils; pip not found." 1>&2
fi

# Gem
if command_exists gem; then
    while read gem_name; do
        sudo gem install $gem_name
    done <./gem.txt
else
    echo "Unable to install Ruby gems; gem not found." 1>&2
fi
