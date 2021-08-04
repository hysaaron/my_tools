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

# Install configurations of vim
echo "Installing VIM-related configurations";
tar xjf vim-related.tar.bz2
mv ~/.vim ~/.vim_bak
mv ~/.vimrc ~/.vimrc_bak
mv .vim* ~

# Install git-supported .bashrc
echo "Installing git-related .bashrc";
tar xjf git_bashrc.tar.bz2
if [[ -e ~/.bashrc ]];then
  md5_current=$(md5sum ~/.bashrc | awk '{print $1}');
  md5_new=$(md5sum .bashrc | awk '{print $1}');
  if [ $md5_current = $md5_new ];then
    echo INFO: same .bashrc;
  else
    mv ~/.bashrc ~/.bashrc_bak;
    mv .bashrc ~
  fi
else
  mv .bashrc ~
fi

export PATH=${PWD}/bin:${PATH}
