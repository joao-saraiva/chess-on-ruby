# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/queen"

class QueenTest < MiniTest::Test
  def setup 
    @black_queen = Queen.new("black")
  end

  def test_assignment
    assert_equal 'Q', @black_queen.signature
    assert_equal 'black', @black_queen.color
    assert_nil @black_queen.current_position
  end

  def test_moves
    assert_equal(
      {
        vertical_moves: [],
        horizontal_moves: [], 
        top_left: [], 
        top_right: [], 
        bottom_left: [],
        bottom_right: []
      }, @black_queen.moves
    )

    @black_queen.current_position = "a1"

    assert_equal(
      {
        vertical_moves: %w[a2 a3 a4 a5 a6 a7 a8], 
        horizontal_moves: %w[b1 c1 d1 e1 f1 g1 h1],
        top_left: [], 
        top_right: %w[b2 c3 d4 e5 f6 g7 h8], 
        bottom_left: [], 
        bottom_right: []
      }, @black_queen.moves
    )

    @black_queen.current_position = "h1"

    assert_equal(
      {
        vertical_moves: %w[h2 h3 h4 h5 h6 h7 h8], 
        horizontal_moves: %w[g1 f1 e1 d1 c1 b1 a1].reverse,
        top_left: %w[g2 f3 e4 d5 c6 b7 a8], 
        top_right: [], 
        bottom_left: [], 
        bottom_right: []
      }, @black_queen.moves
    )

    @black_queen.current_position = "d4"

    assert_equal(
      {
        vertical_moves: %w[d1 d2 d3 d5 d6 d7 d8], 
        horizontal_moves: %w[a4 b4 c4 e4 f4 g4 h4],
        top_left: %w[c5 b6 a7], 
        top_right: %w[e5 f6 g7 h8], 
        bottom_left: %w[c3 b2 a1], 
        bottom_right: %w[e3 f2 g1]
      }, @black_queen.moves
    )

  end
end