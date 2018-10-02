#!/bin/bash

# A simple guessing game

# Get a random number < 100 (is it truly random?? doubt it..)
declare -ir target=$(( ($RANDOM % 100) + 1 ))

# Initialize the user's guess
declare -i guess=0

echo "Guess a number between 0 and 100..."

until (( $guess == target )); do
   read -p "Take a guess: " guess

   # if a guess is 0, it was not a number
   (( guess )) || continue

   if ((  guess < target )); then
      echo "Higher!"
   elif (( guess > target )); then
      echo "Lower!"
   else
      echo "You found it!"
   fi
done

exit 0
