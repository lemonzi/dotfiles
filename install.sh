#!/bin/bash

set -eu

# INSTALL SCRIPT
# Requires: vim, clang, tern, pip (python), gem (ruby)

# Dotfiles
for f in ./dotfiles/*; do
    ln -fs $(pwd)/dotfiles/$(basename "$f") ~/.$(basename "$f")
done

# Vim
mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo
vim +PluginInstall +qall
# YCM
pushd ~/.vim/bundle/YouCompleteMe
    # With JavaScript: add --tern-completer
    ./install.py --clang-completer
popd
# Color-coded
pushd ~/.vim/bundle/color_coded
    mkdir -p build && cd build
    cmake ..
    make && make install # Compiling with GCC is preferred, ironically
    # Cleanup afterward; frees several hundred megabytes
    make clean && make clean_clang
popd

# PIP
pip install -r pip.txt
