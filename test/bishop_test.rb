# frozen_string_literal: true

require 'minitest/autorun'

require_relative '../lib/bishop'

class BishopTest < MiniTest::Test
  def setup
    @black_bishop = Bishop.new("black")
  end

  def test_bishop_assignment
    assert_equal 'B', @black_bishop.signature
    assert_equal 'black', @black_bishop.color
    assert_nil @black_bishop.current_position
  end

  def test_moves
    assert_equal(
      {top_left: [], top_right: [], bottom_left: [], bottom_right: []}, @black_bishop.moves
    )

    @black_bishop.current_position = "h1"

    assert_equal(
      {top_left: %w[g2 f3 e4 d5 c6 b7 a8], top_right: [], bottom_left: [], bottom_right: [] }, @black_bishop.moves
    )

    @black_bishop.current_position = "a1"

    assert_equal(
      {top_left: [], top_right: %w[b2 c3 d4 e5 f6 g7 h8], bottom_left: [], bottom_right: [] }, @black_bishop.moves
    )

    @black_bishop.current_position = "h8"

    assert_equal(
      {top_left: [], top_right: [], bottom_left: %w[g7 f6 e5 d4 c3 b2 a1], bottom_right: []}, @black_bishop.moves
    )

    @black_bishop.current_position = "a8"

    assert_equal(
      {top_left: [], top_right: [], bottom_left: [], bottom_right: %w[b7 c6 d5 e4 f3 g2 h1]}, @black_bishop.moves
    )

    @black_bishop.current_position = "d4"

    assert_equal(
      {top_left: %w[c5 b6 a7], top_right: %w[e5 f6 g7 h8], bottom_left: %w[c3 b2 a1], bottom_right: %w[e3 f2 g1]}, @black_bishop.moves
    )
  end
end