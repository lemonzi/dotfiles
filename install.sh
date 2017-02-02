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
pip install -r ./pip.txt
