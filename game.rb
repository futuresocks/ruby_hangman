class Game

  attr_reader :player, :word, :guessed

   def initialize(player, word)
     @player = player
     @word = word
     @guessed = []
   end

   def guess(letter)
     @guessed << letter if !@guessed.include? letter
     player.lose_life if !@word.guess(letter)
   end

   def is_lost?
     return player.lives == 0
   end

   # def is_won?
   #   return !@word.display.include? "*"
   # end

   def display_word
     return @word.display
   end

end
