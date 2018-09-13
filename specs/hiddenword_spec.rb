require('minitest/autorun')
require('minitest/rg')
require_relative('../hiddenword.rb')

class TestHiddenWord < Minitest::Test

  def setup
    @word = HiddenWord.new("bananas")
    @capitalword = HiddenWord.new("BANANAS")
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
    assert_equal(true, @capitalword.answer_includes_letter?("b"))
  end

  def test_answer_includes_letter__capital
    assert_equal(true, @word.answer_includes_letter?("B"))
    assert_equal(true, @capitalword.answer_includes_letter?("B"))
  end

  def test_get_indices_of_letter
    assert_equal([1,3,5], @word.get_indexes_of_letter("a"))
    assert_equal([1,3,5], @capitalword.get_indexes_of_letter("a"))
  end

  def test_get_indices_of_letter__capital
    assert_equal([1,3,5], @word.get_indexes_of_letter("A"))
    assert_equal([1,3,5], @capitalword.get_indexes_of_letter("A"))
  end

  def test_reveal_letters
    @word.reveal_letters([1,3,5])
    assert_equal("*a*a*a*", @word.display)
  end

  def test_guess__single_letter
    @word.guess("b")
    @capitalword.guess("b")
    assert_equal("b******", @word.display)
    assert_equal("B******", @capitalword.display)
  end

  def test_guess__single_letter__capital
    @word.guess("B")
    @capitalword.guess("B")
    assert_equal("b******", @word.display)
    assert_equal("B******", @capitalword.display)
  end

  def test_guess__multiple_letters
    @word.guess("a")
    @capitalword.guess("a")
    assert_equal("*a*a*a*", @word.display)
    assert_equal("*A*A*A*", @capitalword.display)
  end

  def test_guess__multiple_letters__capital
    @word.guess("A")
    @capitalword.guess("A")
    assert_equal("*a*a*a*", @word.display)
    assert_equal("*A*A*A*", @capitalword.display)
  end

  def test_guess__letter_not_found
    result = @word.guess("z")
    assert_equal(false, result)
    assert_equal("*******", @word.display)
  end

  def test_guess__letter_not_found__capital
    result = @word.guess("Z")
    assert_equal(false, result)
    assert_equal("*******", @word.display)
  end

end
