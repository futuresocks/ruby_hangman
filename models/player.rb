class Player

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 6
  end

  def lose_life()
    @lives -= 1 if @lives > 0
  end

end
