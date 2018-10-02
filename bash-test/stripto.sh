#!/bin/bash

# Prints standard input to standard output discarding
# all lines before the first line matching the argument string.

[[ ! $1 ]] && { echo "Need first argument" >&2; exit 1; }

# read upto first match
while read -r || [[ $REPLY ]]; do
   if [[ $REPLY =~ $1 ]]; then
      echo "$REPLY"
      break
   fi
done

# just print the rest of the file
while read -r || [[ $REPLY ]]; do
   echo "$REPLY"
done

exit 0
