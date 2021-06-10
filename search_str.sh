#!/bin/bash
################################################################################
# ©2021 hysaaron. All Rights Reserved.
#
# Author: hysaaron
# Email: 412739506@qq.com
# Filename: search_str.sh
# Description: Search string among .py files in specified root.
#
# Version 0.0
#   Search string among .py files in specified root.
#
################################################################################


if [ $# -eq 2 ];then
    SEARCH_ROOT=$1;
    STRING=$2;
elif [ $# -eq 1 ];then
    SEARCH_ROOT=.;
    STRING=$1;
else
    echo -e "Wrong arguments.\nUsage:\n\tbash search_str.sh [SEARTCH_ROOT] STRING":
    exit 1;
fi

for i in `find $SEARCH_ROOT | grep "\.py"`;
do
    num=`grep $STRING $i | wc -l`;
    if [ $num -gt 0 ];then
        echo $i;
        cat -n $i | grep $STRING;
        echo;
    fi
done
