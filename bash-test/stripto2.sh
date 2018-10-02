#!/bin/bash

# Prints standard input to standard output discarding
# all lines before the first line matching the argument string.

if [[ ! $1 ]]; then
   echo "Need first argument" >&2
   exit 1
fi

found=""

# read up to first match
while read -r || [[ $REPLY ]]; do
   if [[ ! $found ]]; then
      if [[ $REPLY =~ $1 ]]; then
         found="yep"
      else
         continue
      fi
   fi
   echo "$REPLY"
done

exit 0
