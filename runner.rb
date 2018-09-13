require 'io/console'
require_relative('game.rb')
require_relative('player.rb')
require_relative('hiddenword.rb')

puts "Enter your name!"
name = gets.chomp

player = Player.new(name)

puts "Enter the SECRET WORD"
word = STDIN.noecho(&:gets).chomp

hidden_word = HiddenWord.new(word)

puts "Game on!"

game = Game.new(player, hidden_word)

while(!game.is_lost? && !game.is_won?)
  puts "#{player.name}, guess a letter!"
  input = gets.chomp[0]
  game.guess(input)
  game.game_status
end

puts "The answer was #{game.show_answer}"
result = game.is_won? ? "Well done!" : "Better luck next time!"
puts result
puts "GAME OVER"
