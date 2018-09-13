require('minitest/autorun')
require('minitest/rg')
require_relative('../hiddenword.rb')

class TestHiddenWord < Minitest::Test

  def setup
    @word = HiddenWord.new("bananas")
    @sentence = HiddenWord.new("here is a sentence")
  end

  def test_answer
    assert_equal("bananas", @word.answer)
  end

  def test_display
    assert_equal("*******", @word.display)
  end

  def test_display__sentence
    assert_equal("**** ** * ********", @sentence.display)
  end

  def test_answer_includes_letter
    assert_equal(true, @word.answer_includes_letter?("b"))
  end

  def test_get_indices_of_letter
    assert_equal([1,3,5], @word.get_indexes_of_letter("a"))
  end

  def test_reveal_letters
    @word.reveal_letters([1,3,5])
    assert_equal("*a*a*a*", @word.display)
  end

  def test_guess__single_letter
    @word.guess("b")
    assert_equal("b******", @word.display)
  end

  def test_guess__multiple_letters
    @word.guess("a")
    assert_equal("*a*a*a*", @word.display)
  end

  def test_guess__letter_not_found
    result = @word.guess("z")
    assert_equal(false, result)
    assert_equal("*******", @word.display)
  end

end
