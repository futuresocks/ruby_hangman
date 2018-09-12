class HiddenWord

  attr_reader :answer, :display

  def initialize(word)
    @answer = word
    @display = word.chars.map { |letter| letter == " " ? " " : "*" }.join
  end



end
