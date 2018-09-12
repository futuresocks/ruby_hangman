# require('pry-byebug')

class HiddenWord

  attr_reader :answer, :display

  def initialize(word)
    @answer = word
    @display = word.chars.map { |letter| letter == " " ? " " : "*" }.join
  end

  def guess(letter)
    if @answer.include? letter
      indices_of_letter = (0 ... @answer.length).find_all { |i| @answer[i] == letter }
      indices_of_letter.each do |index|
        @display[index] = @answer[index]
      end
    else
      return false
    end
  end

end
