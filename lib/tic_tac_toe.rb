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
  user_input.to_i - 1
end

#-------------------------------------------------------------------

def move(board, index, token)
  board[index] = token
end

#-------------------------------------------------------------------

def position_taken?(board, index)
  if (board[index] == "" || board[index] == " " || board[index] == nil)
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
  puts "Please choose a number 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
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

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

#-------------------------------------------------------------------

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

#-------------------------------------------------------------------

def draw?(board)
  full?(board) && !won?(board)
end

#-------------------------------------------------------------------

def over?(board)
  if won?(board) || full?(board) == true
    return true
  else
    return false
  end
end

#-------------------------------------------------------------------

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

#-------------------------------------------------------------------

def play(board)
  until over?(board) == true
    turn(board)
    over?(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
