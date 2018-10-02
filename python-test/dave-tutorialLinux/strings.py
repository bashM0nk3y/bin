# Python Strings

single_quoted = 'morgan everett'
double_quoted = "JC Denton"
multi_line = """
   In the beginning, the NSF was a nuisance.

   Now, they are a catastrophe.
      Paris? A bunch of old men playing at running the world.
"""
print(multi_line)

# Escaping
truth = 'You\'ll never need to escape from UNATCO HQ...'

# Common string methods
"JC Denton".upper()
double_quoted.lower()
double_quoted.title()

# Build some strings with concatenation
print(single_quoted + " has an agenda all his own.")
whitespace_str = "\nOr does he?\t\the does..."
biggest_string_ever = multi_line + single_quoted + whitespace_str

# Print it all out!
print(biggest_string_ever)