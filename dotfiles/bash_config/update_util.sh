#!/bin/bash

# Function that recompiles YouCompleteMe (callable from the command line)
function compile_youcompleteme() {
    pushd ~/.vim/bundle/YouCompleteMe
        # With JavaScript support: add --tern-completer
        ./install.py --clang-completer
    popd
}
export -f compile_youcompleteme

# Function that recompiles Color-coded (callable from the command line)
function compile_colorcoded() {
    pushd ~/.vim/bundle/color_coded
        mkdir -p build && cd build
        cmake ..
        make && make install
        # Cleanup afterward; frees several hundred megabytes
        make clean && make clean_clang
    popd
}
export -f compile_colorcoded
