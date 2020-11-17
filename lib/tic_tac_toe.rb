class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
    ]
  
  def initialize
    @board = Array.new(9, ' ')
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " -----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " -----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1 
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true 
    else
      false 
    end
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index) ? true : false
  end
  
  def turn_count
    @board.select {|token| token == "X" || token == "O"}.count 
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Pick number between 1-9 to make move"
    user_input = gets.strip
    index = input_to_index(user_input)
    until valid_move?(index)
      puts "Pick number between 1-9 to make move"
      user_input = gets.strip
      index = input_to_index(user_input)
    end
    current_player
    move(index)
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      position_taken(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
    end
  end  
end