#!/usr/bin/python3

# Fizzbuzz via strings

arg = int(input("Enter a number to be used as a range: "))

for i in range(arg + 1):
    string = ""
    if i % 3 == 0:
        string += "Fizz"
    if i % 5 == 0:
        string += "Buzz"
    if i % 3 != 0 and i % 5 != 0:
        string = str(i)
    print(string)