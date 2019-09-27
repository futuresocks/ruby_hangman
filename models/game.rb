class Game

  attr_reader :player, :word, :guessed

   def initialize(player, word)
     @player = player
     @word = word
     @guessed = []
   end

   def guess(letter)
     @guessed << letter if !@guessed.include? letter && !@word.answer_includes_letter?(letter)
     player.lose_life if !@word.guess(letter)
   end

   def is_lost?
     return player.lives == 0
   end

   def is_won?
     return !(display_word().chars.include? "*")
   end

   def display_word
     return @word.display
   end

   def show_answer
     return @word.answer
   end

   def game_status
     puts display_word()
     puts "#{@player.name} has #{@player.lives} lives left!"
     puts "Guessed letters: #{@guessed}"
   end



end
