#!/bin/bash
# '-x' (after shebang) useful for debugging (outputs all bash evaluated lines in script)

# to debug a piece of a script use:
# set -x
# ...code...
# set +x

# A simple note taking script
# Author: Donald f'n Trump

# Get the date
declare -r date=$(date)

# get the topic
declare -r topic="$1"

if [[ $topic ]]; then
   filename="${HOME}/tmp/${topic}-notes.txt"
else
   filename="${HOME}/tmp/notes.txt"
fi

# Ask user for input
read -p "Your note: " note

if [[ $note ]]; then
   echo "${date}: ${note}" >> "$filename"
   echo "Note '$note' saved to $filename"
else
   echo "No input; note wasnt saved." 1>&2
fi
