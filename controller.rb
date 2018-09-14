require('sinatra')
require('random_word_generator')
require_relative('models/game')
require_relative('models/player')
require_relative('models/hiddenword')

def initialize
  super()
  player = Player.new("Colin")
  word = RandomWordGenerator.word
  hiddenword = HiddenWord.new(word)
  @game = Game.new(player, hiddenword)
end

get "/" do
  erb(:landing_page)
end

get "/guess/:letter" do
  @game.guess(params[:letter])
  @letters = ("a".."z").select {|letter| letter unless @game.guessed.include? letter}.uniq
  erb(:guess)
end
