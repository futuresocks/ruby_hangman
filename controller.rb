require('sinatra')
require_relative('models/game')
require_relative('models/player')
require_relative('models/hiddenword')

def initialize
  super()
  @player = Player.new("Colin")
  @hiddenword = HiddenWord.new("Cheesecake")
  @game = Game.new(@player, @hiddenword)
end

get "/" do
  @letters = ("a".."z")
  erb(:landing_page)
end

get "/:letter" do
  @game.guess(params[:letter])
  @guessed = @game.guessed
  @display = @game.display_word
  erb(:guess)
end
