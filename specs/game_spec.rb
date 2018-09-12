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

  def test_is_lost__lives_left
    assert_equal(false, @game.is_lost?)
  end

  def test_is_lost__lives_lost
    @player.lives = 0
    assert_equal(true, @game.is_lost?)
  end

  def test_is_won__letters_left
    assert_equal(false, @game.is_won?)
  end

  def test_is_won__letters_gone
    @word2 = HiddenWord.new("a")
    @game2 = Game.new(@player, @word2)
    @game2.guess("a")
    assert_equal(true, @game2.is_won?)
  end

  def test_show_answer
    assert_equal("bananas", @game.show_answer)
  end

  def test_display_word
    assert_equal("*******", @game.display_word)
  end

  def test_game_status
    assert_output("*******\nColin has 6 lives left!\nGuessed letters: []\n"){@game.game_status}
  end

end
