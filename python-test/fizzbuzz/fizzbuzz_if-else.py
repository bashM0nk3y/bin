#!/usr/bin/python3

# Fizzbuzz via if/elif/else

# arg = int(input("Enter number: "))

arg = 21

for i in range(1, arg + 1):
    if i % 3 == 0 and i % 5 == 0:
        print("Fizzbuzz")
    elif i % 3 == 0:
        print("Fizz")
    elif i % 5 == 0:
        print("Buzz")
    else:
        print(i)
