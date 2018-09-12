require('minitest/autorun')
require('minitest/rg')
require_relative('../player.rb')
require_relative('../game.rb')
require_relative('../hiddenword.rb')

class TestGame < Minitest::Test

  def setup
    @player = Player.new("Colin")
    @word = HiddenWord.new("bananas")
    @game = Game.new(@player, @word)
  end

  def test_has_player
    assert_equal(@player, @game.player)
  end

  def test_has_word
    assert_equal(@word, @game.word)
  end

  def test_guessed_letters__start_empty
    assert_equal([], @game.guessed)
  end

  def test_guessed_letters__take_guess
    @game.guess("a")
    assert_equal(["a"], @game.guessed)
  end

  def test_guess__cannot_duplicate
    @game.guess("a")
    @game.guess("a")
    assert_equal(["a"], @game.guessed)
  end

  def test_guess__reveals_letters
    @game.guess("a")
    assert_equal("*a*a*a*", @game.display_word())
  end

  def test_guess__lose_lives_if_wrong
    @game.guess("z")
    assert_equal(5, @player.lives)
  end 

end
