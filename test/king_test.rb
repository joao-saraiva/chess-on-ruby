# frozen_string_literal: true

require 'minitest/autorun'
require 'byebug'
require_relative '../lib/king'

class KingTest < MiniTest::Test
  def setup
    @black_king = King.new('black')
  end

  def test_king_assignment
    assert_equal 'K', @black_king.signature
    assert_equal 'black', @black_king.color
    assert_nil @black_king.current_position
  end

  def test_moves
    assert_equal({
                   top_moves: [],
                   bottom_moves: [],
                   left_moves: [],
                   right_moves: []
                 }, @black_king.moves)

    @black_king.current_position = 'd4'

    assert_equal({
                   top_moves: %w[d5 c5 e5],
                   bottom_moves: %w[d3 c3 e3],
                   left_moves: ['c4'],
                   right_moves: ['e4']
                 }, @black_king.moves)

    @black_king.current_position = 'd1'

    assert_equal({
                   top_moves: %w[d2 c2 e2],
                   bottom_moves: [],
                   left_moves: ['c1'],
                   right_moves: ['e1']
                 }, @black_king.moves)

    @black_king.current_position = 'd8'

    assert_equal({
                   top_moves: [],
                   bottom_moves: %w[d7 c7 e7],
                   left_moves: ['c8'],
                   right_moves: ['e8']
                 }, @black_king.moves)
  end
end
