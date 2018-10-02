#!/bin/bash

# Compare the length of two strings
# Author: Amelia Eirheart

# Check number of args
if [[ $# -ne 2 ]]; then
   echo "Need exactly two arguments."
   exit 1
fi

len_1=${#1}
len_2=${#2}

# Which one is longer?
if [[ $len_1 -gt $len_2 ]]; then
   echo "$1 is longer than $2."
elif [[ $len_1 -eq $len_2 ]]; then
   echo "$1 is equal in length to $2."
else
   echo "'$2' is longer than $2"
fi

exit 0
