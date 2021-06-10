#!/bin/bash
################################################################################
# ©2021 hysaaron. All Rights Reserved.
#
# Author: hysaaron
# Email: 412739506@qq.com
# Filename: search_str.sh
# Description: Search codes among files in specified root.
# 
# Version 3.0
#   Get rid of find, using only grep.
#
################################################################################


if [ $# -eq 2 ];then
    SEARCH_ROOT=$1;
    STRING=$2;
elif [ $# -eq 1 ];then
    SEARCH_ROOT=.;
    STRING=$1;
else
    echo "Wrong arguments."
    echo -e "Usage:\n\t$0 [SEARTCH_ROOT] PATTERN"
    exit 1;
fi

ext=(.py \
    .cpp \
    .hpp \
    .cc \
    .hh \
    .c \
    .h \
    .sh\
    )

GREP="grep --color -Ewrn"

for e in ${ext[@]};
do
    $GREP --include="*"$e $STRING $SEARCH_ROOT;
done
