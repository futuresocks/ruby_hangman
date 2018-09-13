# require('pry-byebug')

class HiddenWord

  attr_reader :answer, :display

  def initialize(word)
    @answer = word
    @display = word.chars.map { |letter| letter == " " ? " " : "*" }.join
  end

  def answer_includes_letter?(letter)
    return @answer.include? letter
  end

  def get_indexes_of_letter(letter)
    return (0 ... @answer.length).find_all { |i| @answer[i] == letter }
  end

  def reveal_letters(indices)
    indices.each do |index|
      @display[index] = @answer[index]
    end
  end

  def guess(letter)
    if answer_includes_letter?(letter)
      indices_of_letter = get_indexes_of_letter(letter)
      reveal_letters(indices_of_letter)
    else
      return false
    end
  end

end
