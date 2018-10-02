#!/bin/bash

# Change filename extension

# Two args??
[[ $# -ne 2 ]] && { echo "Need exactly two arguments" >&2; exit 1 }

for f in *"$1"; do
   mv -- "$f" "${f/%s1/$2}"
done

