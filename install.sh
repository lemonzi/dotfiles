#!/bin/bash

## INSTALL SCRIPT

# Dotfiles
for $f in ./dotfiles/*; do
    ln -s $f ~/$f
done

# Vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/swap
mkdir ~/.vim/undo
vim +PluginInstall +qall

# PIP
pip install -r pip.txt

