require('minitest/autorun')
require('minitest/rg')
require_relative('../player.rb')

class TestPlayer < Minitest::Test

  def setup
    @player = Player.new("Colin")
  end

  def test_player_has_name
    assert_equal("Colin", @player.name)
  end

  def test_player_starts_six_lives
    assert_equal(6, @player.lives)
  end

  def test_player_can_lose_lives
    @player.lose_life()
    assert_equal(5, @player.lives)
  end

  def test_player_lives_run_out
    @player.lives = 0
    @player.lose_life()
    assert_equal(0, @player.lives)
  end  

end
