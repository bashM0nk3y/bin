#!/bin/bash

case $1 in
   cat)
      echo "meow";;
   dog)
      echo "woof woof";;
   cow)
      echo "mooo";;
   *)
      echo "unknown animal";;
esac
