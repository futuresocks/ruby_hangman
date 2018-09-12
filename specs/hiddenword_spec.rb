require('minitest/autorun')
require('minitest/rg')
require_relative('../hiddenword.rb')

class TestHiddenWord < Minitest::Test

  def setup
    @word = HiddenWord.new("bananas")
    @sentence = HiddenWord.new("here is a sentence")
  end

  def test_hiddenword_has_answer
    assert_equal("bananas", @word.answer)
  end

  def test_hiddenword_has_display
    assert_equal("*******", @word.display)
  end

  def test_hiddenword_has_display__sentence
    assert_equal("**** ** * ********", @sentence.display)
  end

end
