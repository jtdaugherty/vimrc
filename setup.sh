#!/usr/bin/env bash

if [ ! -d bundle/vundle ]
then
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi

if [ ! -f ~/.vimrc ]
then
    ln -s `pwd`/vimrc ~/.vimrc
fi

vim +BundleInstall +qall
