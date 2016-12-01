#!/bin/bash

set -eu

# INSTALL SCRIPT
# Requires: vim, clang, tern (optional), pip / python, gem / ruby

# Dotfiles
for f in ./dotfiles/*; do
    ln -fs $(pwd)/dotfiles/$(basename "$f") ~/.$(basename "$f")
done

# Homebrew
if [ ! -d /usr/local/Homebrew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew tap homebrew/bundle
brew bundle

# Login shell
chsh -s /usr/local/bin/bash $USER

# Vim (including plug-ins)
mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo
vim +PluginInstall +qall
# YCM
pushd ~/.vim/bundle/YouCompleteMe
    # With JavaScript support: add --tern-completer
    ./install.py --clang-completer
popd
# Color-coded
pushd ~/.vim/bundle/color_coded
    mkdir -p build && cd build
    cmake ..
    make && make install
    # Cleanup afterward; frees several hundred megabytes
    make clean && make clean_clang
popd
# Powerline-fonts
pushd ./vendor/powerline-fonts
    ./install.sh
popd

# PIP
pip install -r ./pip.txt

# Gem
while read gem; do
    sudo gem install $gem
done <./gem.txt
