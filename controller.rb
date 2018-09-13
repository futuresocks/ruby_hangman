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
  @letters = ("a".."z")
  erb(:landing_page)
end

get "/:letter" do
  @game.guess(params[:letter])
  erb(:guess)
end
