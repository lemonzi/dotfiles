#!/bin/bash

## INSTALL SCRIPT

# Dotfiles
# cp -r !(.git|install.sh|README.md) ~
rsync -a --exclude-from="exclude" . ~

# Vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/backup
mkdir ~/.vim/swap
mkdir ~/.vim/undo
vim +PluginInstall +qall

# PIP
pip install -r pip.txt

