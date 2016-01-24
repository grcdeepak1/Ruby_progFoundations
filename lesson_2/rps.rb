# 1. All players pick either Rock, Paper or Scissors
# 2. Compare: paper > rock, rock > scissors, scissors > paper, or tie if same
# 3. Play again
require 'pry'

CHOICES = { 'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors' }.freeze
puts 'Welcome to Paper, Rock, Scissors!'

def display_winning_msg(winning_choice, winner)
  case winning_choice
  when 'p'
    puts 'Paper wraps Rock'
  when 'r'
    puts 'Rock smashes Scissors'
  when 's'
    puts 'Scissors cuts Paper'
  end
  if winner == 'player'
    puts 'You Won !'
  else
    puts 'Computer Won'
  end
end

loop do
  # Player chooses
  loop do
    puts 'Pick one (p, r, s):'
    player_choice = gets.chomp.downcase
    break if CHOICES.keys.include?(player_choice)
  end
  # Computer choses
  computer_choice = CHOICES.keys.sample

  # Logic
  if player_choice == computer_choice
    puts 'Its a Tie'
  elsif player_choice == 'p' && computer_choice == 'r' ||
        player_choice == 'r' && computer_choice == 's' ||
        player_choice == 's' && computer_choice == 'p'
    display_winning_msg(player_choice, 'player')
  else
    display_winning_msg(computer_choice, 'computer')
  end
  puts 'Play Again (y/n):'
  break if gets.chomp.downcase != 'y'
end
