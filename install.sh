#!/bin/bash

BIN_DIR=bin
mkdir -p $BIN_DIR

tools=(search_str)
for tool in ${tools[@]};
do
    echo "Installing ${tool}";
    ln -s `pwd`/${tool}.sh `pwd`/${BIN_DIR}/${tool};
done

export PATH=`pwd`/bin:$PATH
