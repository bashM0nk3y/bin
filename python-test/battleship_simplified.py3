#!/usr/bin/python3
# A simplified battleship type game with a 5 x 5 board and one ship.

from random import randint

# Function definitions
def print_board(board):
  for row in board:
    print(" ".join(row))

def random_row(board):
  return randint(0, len(board) - 1)

def random_col(board):
  return randint(0, len(board[0]) - 1)

# Initialize and print the board
board = []
for x in range(0, 5):
  board.append(["O"] * 5)

print_board(board)

# Ship cooridinates
ship_row = random_row(board)
ship_col = random_col(board)
print(ship_row)
print(ship_col)


for turn in range(4):
  print("Turn", turn + 1)

  guess_row = int(input("Guess Row: "))
  guess_col = int(input("Guess Col: "))

  if guess_row == ship_row and guess_col == ship_col:
    print("\nCongratulations! You sank my battleship!\n")
    board[ship_row][ship_col] = '#'
    print_board(board)
    print()
    break
  elif guess_row not in range(5) or \
                guess_col not in range(5):
    print("Oops, that's not even in the ocean.")
  elif board[guess_row][guess_col] == 'X':
    print("You guessed that one already.")
  else:
    print("You missed my battleship!")
    board[guess_row][guess_col] = "X"

  print_board(board)
  if turn == 3:
    print("Game Over")
  turn += 1
