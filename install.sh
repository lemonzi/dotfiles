#!/bin/bash

set -eu

# INSTALL SCRIPT
# Requires: vim, clang, tern, pip (python), gem (ruby)

# Dotfiles
for $f in ./dotfiles/*; do
    ln -s $f ~/$f
done

# Vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/swap
mkdir ~/.vim/undo
vim +PluginInstall +qall
pushd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
popd

# PIP
pip install -r pip.txt

# Gem
while read gem; do
    sudo gem install $gem
done <gem.txt

