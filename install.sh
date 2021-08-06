#!/bin/bash

BIN_DIR=bin
rm -rf ${BIN_DIR}
mkdir -p ${BIN_DIR}

tools=(search_str)
for tool in ${tools[@]};
do
    echo "Installing ${tool}";
    ln -s ${PWD}/${tool}.sh ${PWD}/${BIN_DIR}/${tool};
done

export PATH=${PWD}/bin:${PATH}

# Install configurations of vim
echo "Installing VIM-related configurations";
tar xjf vim-related.tar.bz2
if [[ -e ~/.vim ]];then
  mv ~/.vim ~/.vim_bak
fi
if [[ -e ~/.vimrc ]];then
  mv ~/.vimrc ~/.vimrc_bak
fi
mv my.vim ~/.vim
mv my.vimrc ~/.vimrc

# Install git-supported .bashrc
echo "Installing git-related .bashrc";
tar xjf git_bashrc.tar.bz2
if [[ -e ~/.bashrc ]];then
  mv ~/.bashrc ~/.bashrc_bak;
fi
#mv .bashrc ~
echo "export PATH=${PWD}/bin:${PATH}" > ~/.bashrc
cat my.bashrc >> ~/.bashrc
rm my.bashrc

