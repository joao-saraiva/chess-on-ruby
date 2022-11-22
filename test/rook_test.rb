# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/rook'

class RookTest < MiniTest::Test
  def setup
    @black_rook = Rook.new('black')
  end

  def test_rook_assignment
    assert_equal 'R', @black_rook.signature
    assert_equal 'black', @black_rook.color
    assert_nil @black_rook.current_position
  end

  def test_moves
    assert_equal({ vertical_moves: [], horizontal_moves: [] }, @black_rook.moves)

    @black_rook.current_position = 'd4'

    assert_equal({
                   vertical_moves: %w[d1 d2 d3 d5 d6 d7 d8],
                   horizontal_moves: %w[a4 b4 c4 e4 f4 g4 h4]
                 }, @black_rook.moves)

    @black_rook.current_position = 'h8'

    assert_equal({
                   vertical_moves: %w[h1 h2 h3 h4 h5 h6 h7],
                   horizontal_moves: %w[a8 b8 c8 d8 e8 f8 g8]
                 }, @black_rook.moves)
  end
end
