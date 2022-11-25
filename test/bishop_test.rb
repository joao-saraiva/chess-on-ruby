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

  end
end