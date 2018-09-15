require('sinatra')
require('random_word_generator')
require_relative('models/game')
require_relative('models/player')
require_relative('models/hiddenword')
require('pry')

get "/welcome" do
  erb(:landing_page)
end

post "/welcome" do
  player = Player.new(params[:name])
  word = RandomWordGenerator.word
  p word
  hiddenword = HiddenWord.new(word)
  $game = Game.new(player, hiddenword)
  redirect '/guess'
end

get "/guess" do
  @lives = $game.player.lives
  @letters = ("a".."z").select {|letter| letter unless $game.guessed.include? letter}
  erb(:guess)
end

post "/guess" do
  $game.guess(params[:letter])
  next_page = $game.is_won? || $game.is_lost? ? '/endgame' : '/guess'
  redirect next_page
end

get "/endgame" do
  @outcome = $game.is_won? ? "You win!" : "You lose!"
  @answer = $game.show_answer
  erb(:endgame)
end
