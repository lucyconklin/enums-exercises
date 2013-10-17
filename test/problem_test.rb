gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/problem'

class ExerciseTest < Minitest::Test
  def input
    {"letters" => %w(a b c)}
  end

  def output
    {"capitals" => %w(A B C)}
  end

  def exercise
    Problem.new("capitalize", input, output)
  end

  def test_name
    assert_equal "capitalize", exercise.name
  end

  def test_input_variable
    assert_equal "letters", exercise.input_variable
  end

  def test_input
    assert_equal %w(a b c), exercise.input
  end

  def test_output_variable
    assert_equal "capitals", exercise.output_variable
  end

  def test_output
    assert_equal %w(A B C), exercise.output
  end

  def test_block_variable
    assert_equal "letter", exercise.block_variable
  end

  def test_defaults
    ex = exercise
    refute ex.assignment?
    refute ex.loop?
    refute ex.example?
  end

  def test_assignment
    ex = exercise.assignment!
    assert ex.assignment?
    refute ex.loop?
    refute ex.example?
  end

  def test_loop
    ex = exercise.loop!
    assert ex.assignment?
    assert ex.loop?
    refute ex.example?
  end

  def test_example
    ex = exercise.example!("letter.upcase")
    assert ex.assignment?
    assert ex.loop?
    assert ex.example?
  end
end
