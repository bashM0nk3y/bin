#!/bin/bash

# create_script
# This script creates a new bash script, sets permissions and mor
# Author: Grizzly Adams

# Is there an arg?
if [[ ! $1 ]]; then
   echo "Missing argument"
   exit 1
fi

scriptname="$1"
bindir="${HOME}/bin"
filename="${bindir}/${scriptname}"

# Check to see if file already exists
if [[ -e $filename ]]; then
   echo "File ${filename} already exists"
   exit 1
fi

if type "$scriptname" > /dev/null 2>&1; then
   # aka, if type returns a value of '0'
   echo "There is already a command with name ${scriptname}"
   exit 1
fi

if [[ ! -d $bindir ]]; then
   # if not: create bin directory
   if mkdir "$bindir"; then
      echo "created ${bindir}"
   else
      echo "Could not create ${bindir}"
      exit 1
   fi
fi

# Create a script with a single line
echo '#!/bin/bash' > "$filename"

# Add executable permission
chmod u+x "$filename"

# Open with editor
if [[ $EDITOR ]]; then
   $EDITOR "$filename"
else
   echo "Script was created but cannot open editor because \$EDITOR environment variable is not initialized."
fi
