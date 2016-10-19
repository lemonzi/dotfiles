#!/bin/bash

set -eu

# INSTALL SCRIPT
# Requires: vim, clang, tern, pip (python), gem (ruby)

# Dotfiles
for f in ./dotfiles/*; do
    ln -fs $(pwd)/dotfiles/$(basename "$f") ~/.$(basename "$f")
done

# Homebrew
xcode-select –install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
brew bundle

# Vim
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/swap
mkdir ~/.vim/undo
vim +PluginInstall +qall
# YCM
pushd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
popd
# Color-coded
pushd ~/.vim/bundle/color_coded
mkdir build && cd build
cmake ..
make && make install # Compiling with GCC is preferred, ironically
# Cleanup afterward; frees several hundred megabytes
make clean && make clean_clang
popd

# PIP
#pip install -r pip.txt

# Gem
#while read gem; do
#    sudo gem install $gem
#done <gem.txt

