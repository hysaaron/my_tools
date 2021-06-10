#!/bin/bash
################################################################################
# ©2021 hysaaron. All Rights Reserved.
#
# Author: hysaaron
# Email: 412739506@qq.com
# Filename: search_str.sh
# Description: Search codes among files in specified root.
# 
# Version 2.0
#   Support multiple file extensions, and match only whole words.
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
    echo -e "Usage:\n\tbash search_str.sh [SEARTCH_ROOT] PATTERN"
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

GREP="grep -E -w"

for e in ${ext[@]};
do
    for file in `find $SEARCH_ROOT -name "*"$e`;
    do
        num=`$GREP $STRING $file | wc -l`;
        if [ $num -gt 0 ];then
            echo $file;
            cat -n $file | $GREP $STRING;
            echo;
        fi
    done
done
