# 1. Come up with requirements/specifications, which will determine the scope
# 2. Application logic: sequence of steps
# 3. Translation of those steps into code
# 4. Run code the verify logic
# ===========
# Pseudo Code
# ===========
# draw a board
# assign player1 to "x" (assume player is "x")
# assign player2 to "o" (assume computer is "o")
# loop until (winner || empty squares present)
# {
# 	player1 picks a empty square
# 	did player1 win ?
# 	player2 picks a empty square
# 	did player2 win ?
# }
# if(winner)
# 	print the winner
# else
# 	Its a tie
require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze
INITIAL_MARKER  = ' '.freeze
PLAYER_MARKER   = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
def initialize_board
  b = {}
  (1..9).each { |position| b[position] = ' ' }
  b
end

def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "-----------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "-----------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def empty_positions(b)
  b.select { |_k, v| v == ' ' }.keys
end

def check_winner(b)
  WINNING_LINES.each do |line|
    if b.values_at(*line).count(PLAYER_MARKER) == 3
      print "Winning_lines =  #{line}"
      return "Player"
    end
    if b.values_at(*line).count(COMPUTER_MARKER) == 3
      print "Winning_lines =  #{line}"
      return "Computer"
    end
  end
  nil
end

def player_picks_sqaure(b)
  position = 0
  loop do
    puts "Choose a position (from 1 to 9) to place a piece:"
    position = gets.chomp.to_i
    break if empty_positions(b).include?(position)
  end
  b[position] = PLAYER_MARKER
end

def computer_picks_sqaure(b)
  position = nil

  # defense first
  WINNING_LINES.each do |line|
    position = find_at_risk_square(line, b, PLAYER_MARKER)
    break if position
  end

  # offense
  if !position
    WINNING_LINES.each do |line|
      position = find_at_risk_square(line, b, COMPUTER_MARKER)
      break if position
    end
  end

  if !position
    position = empty_positions(b).sample
  end
  b[position] = COMPUTER_MARKER
end

def find_at_risk_square(line, b, marker)
  if b.values_at(*line).count(marker) == 2
    b.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

board = initialize_board
draw_board(board)
winner = ""

loop do
  player_picks_sqaure(board)
  computer_picks_sqaure(board)
  draw_board(board)
  winner = check_winner(board)
  puts "\nWinner : #{winner}"
  break if winner || empty_positions(board).empty?
end

if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end
