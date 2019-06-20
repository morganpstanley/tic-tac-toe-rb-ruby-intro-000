WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

#-------------------------------------------------------------------

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#-------------------------------------------------------------------

def input_to_index(user_input)
  new_user_input = user_input.to_i
  new_user_input -= 1
  return new_user_input
end

#-------------------------------------------------------------------

def move(board, index, character = "X")
  board[index] = character
  return board
end

#-------------------------------------------------------------------

def position_taken?(board, guess)
  if (board[guess] == "" || board[guess] == " " || board[guess] == nil)
    return false
  else
    return true
  end
end

#-------------------------------------------------------------------

def valid_move?(board, index)
  if index.between?(0, 9) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

#-------------------------------------------------------------------

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

#-------------------------------------------------------------------

def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
end

#-------------------------------------------------------------------

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

#-------------------------------------------------------------------
