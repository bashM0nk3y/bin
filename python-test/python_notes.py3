#!/usr/bin/python3

# -------------------------
# -- String Manipulation --
# -------------------------


# stuff = 'Hello world!'
# print(type(stuff))
# print()
# print(dir(stuff))



# -------
# -- String Library (common ones?)
# -------

# str.capitalise()
# str.center(width[, fillchar])
# str.endswith(suffix[, start[, end]])
# str.find(sub[, start[, end]])
# str.lstrip([chars])
# str.replace(old, new[, count])
# str.lower()
# str.rstrip([chars])
# str.strip([chars])
# str.upper()

# str = "banana"

# pos = str.find('na')
# print(pos)

# aa = str.find('z')
# print(aa)

# greet = 'Hello Neo'
# print('var "greet" =', greet)
# upper_case = greet.upper()
# print('var "upper_case" =', upper_case)
# lower_case = greet.lower()
# print('var "lower_case" =', lower_case)
# print('var "greet" =', greet, '\t\t# original variable unchanged')


# new_str = greet.replace('Neo','Trinity')
# print()
# print(new_str)
# new_str = greet.replace('o','X')
# print(new_str)


# greet = '    Hello Neo    '
# print(greet.lstrip())
# print(greet.rstrip())
# print(greet.strip())


# line = 'Please have a nice day.'
# print(line.startswith('Please'))
# print(line.startswith('please'))
# lower_line = line.lower()
# print(lower_line.startswith('please'))


# -------
# -- Parsing and Extracting
# -------

# data = 'From donald.trump@potus.bloatus Sat Jan   5 09:14:16 2018'

# atpos = data.find('@')
# print(atpos)
# sppos = data.find(' ',atpos)
# print(sppos)
# host = data[atpos+1 : sppos]
# print(host)
# npos = data.find(' ')
# name = data[npos+1:atpos]
# print(name)


# tmp_file = open('print_list.py')
# for line in tmp_file:
#     line = line.rstrip()    # rstrip similar to Perl's chomp
#     print(line)

# # Counting lines in a file
# fhand = open('python_notes.py2')
# count = 0
# for line in fhand:
#     count += 1
# print('Line Count:', count)


# # Reading the whole file
# fhand = open('python_notes.py2')
# inp = fhand.read()
# print(len(inp))
# print(inp[:20])


# # Searching through a file
# for line in fhand:
#     line = line.rstrip()
#     if line.startswith('#'):
#         print(line)


# Using 'in' to select lines
fhand = open('/home/cory/notes/pacman_cheat_sheet')
for line in fhand:
    line = line.rstrip()
    if 'pacman' in line:
        print(line)


# Prompt for file name
fname = input('Enter the file name: ')
fhand = open(fname)
count = 0
for line in fhand:
    if line.startswith('Glork-a-zork'):
        count += 1
print('There were', count, 'Glork-a-zorks in', fname)
