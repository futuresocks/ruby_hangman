require('sinatra')
require('random_word_generator')
require_relative('models/game')
require_relative('models/player')
require_relative('models/hiddenword')
require('pry')

  player = Player.new("Colin")
  word = RandomWordGenerator.word
  hiddenword = HiddenWord.new(word)
  $game = Game.new(player, hiddenword)

get "/" do
  erb(:landing_page)
end

get "/guess/:letter" do
  $game.guess(params[:letter])
  redirect '/endgame' if $game.is_won? || $game.is_lost?

  @lives = $game.player.lives
  @letters = ("a".."z").select {|letter| letter unless $game.guessed.include? letter}
  erb(:guess)
end

get "/endgame" do
  binding.pry
  @outcome = $game.is_won? ? "You win!" : "You lose!"
  @answer = $game.show_answer
  erb(:endgame)
end

get "/newgame" do
  player = Player.new("Colin")
  word = RandomWordGenerator.word
  hiddenword = HiddenWord.new(word)
  $game = Game.new(player, hiddenword)
  binding.pry
  @letters = ("a".."z")
  erb(:startgame)
end
