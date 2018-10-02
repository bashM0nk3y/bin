#!/bin/bash

# compare file count of two directories
# Author: Ferdinand MacGillicutty

# check number of args
if [[ $# -ne 2 ]]; then
   echo "Need exactly two arguments"
   exit 1
fi

# Both args should be directories
if [[ ! -d $1 ]]; then
   echo "'$1' is not a directory."
   exit 1
fi

if [[ ! -d $2 ]]; then
   echo "'$2' is not a directory."
   exit 1
fi

dir1="$1"
dir2="$2"

# Get number of files in directories
count_1=$(ls -A1 "$dir1" | wc -l)
count_2=$(ls -A1 "$dir2" | wc -l)

# Which one has the most files?
if [[ $count_1 -gt $count_2 ]]; then
   echo "'${dir1}' has more files than '${dir2}'."
elif [[ $count_1 -eq $count_2 ]]; then
   echo "'${dir1}' has the same amount of files as '${dir2}'."
else
   echo "'${dir2}' has more files than '${dir1}'."
fi

exit 0
