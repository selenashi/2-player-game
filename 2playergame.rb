require 'colorize'


#Array of hashes containing player info
@player = [
  {
    name: '',
    score: 3
  }, 
  {
    name: '',
    score: 3
  },
]

def generate_question
  @number1 = rand(1..20)
  @number2 = rand(1..20)
end

def prompt_player_for_answer(player)
  print "#{player[:name]},What does #{@number1} plus #{@number2} equal?"
  @player_answer = gets.chomp.to_i
end


def verify_answer(player)
  if @player_answer == @number1 + @number2
    puts "You've got the right answer".blue
  else
    puts "You've got the wrong answer".red
    player[:score] -= 1
  end
end

def step_one(player)
  print "What is your name?"
  name_answer = gets.chomp
  player[:name] = name_answer
end


def still_playing? 
  @player[0][:score] > 0 && @player[1][:score] > 0
end


def game_over
  puts "Game over!"
end

def score_reset
  @player[0][:score] = 3
  @player[1][:score] = 3
end

def play_again
  puts "Would you like to play again?Y/N"
  input = gets.chomp.upcase
  if input == "Y"
    score_reset
    play_game 
  else
  puts "See you!"
  end
end

def play_game
  if @player[0][:name].empty?
    @player.each do |player|
      step_one(player)
    end
  end

  while still_playing?
    @player.each do |player|
      generate_question
      prompt_player_for_answer(player)
      verify_answer(player)
      break if !still_playing?
    end
  end
      game_over
      play_again
end


#Test Code
puts "Welcome to the 2 player game!"
play_game

