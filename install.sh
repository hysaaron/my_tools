#!/bin/bash

BIN_DIR=bin
rm -rf $BIN_DIR
mkdir -p $BIN_DIR

tools=(search_str)
for tool in ${tools[@]};
do
    echo "Installing ${tool}";
    ln -s `pwd`/${tool}.sh `pwd`/${BIN_DIR}/${tool};
done

export PATH=`pwd`/bin:$PATH

# Install configurations of vim
tar xjf vim-related.tar.bz2
mv ~/.vim ~/.vimbak
mv ~/.vimrc ~/.vimrcbak
mv .vim* ~
