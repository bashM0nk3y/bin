#!/bin/bash

# Just a small list of bash loops

if [ -f /path/to/some/file ]; then
    code to execute
elif ??; then
    code to exe
else
    foo bar
fi


while test; do
   ;; code to be repeated
done

until test; do
   ;; code to be repeated
done

# For loop
for VAR in WORDS; do
   ;; code to be repeated
done

for i in range ??; do
   ;; code..
done

# C-style for loop
for (( i=0; i<10; i++ )); do
   ;; code...
done

# Case (switch statement)
case WORD in
   PATTERN1)
      code for pattern 1;;
   PATTERN2)
      code for pattern 2;;
   PATTERN3)
      code for pattern 3
      break;;
   PATTERNn)
      code for pattern n;;
esac

## more examples

## Reads a file
while read -r; do
   printf "%s\n" "$REPLY"
done <"$1"


