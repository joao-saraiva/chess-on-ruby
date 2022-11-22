# frozen_string_literal: true

require 'minitest/autorun'
require 'byebug'
require_relative '../lib/pawn'

class PawnTest < MiniTest::Test
  def setup
    @black_pawn = Pawn.new('black')
    @white_pawn = Pawn.new('white')
  end

  def test_pawmn_assignment
    assert_equal 'P', @black_pawn.signature
    assert_equal 'black', @black_pawn.color
    assert_nil @black_pawn.current_position
    assert_equal true, @black_pawn.first_move
  end

  def test_moves
    assert_equal({ straight_line_moves: [], left_moves: [], right_moves: [] }, @black_pawn.moves)

    @black_pawn.current_position = 'e2'
    assert_equal({
                   straight_line_moves: %w[e3 e4],
                   left_moves: ['d3'],
                   right_moves: ['f3']
                 }, @black_pawn.moves)

    @black_pawn.first_move = false
    @black_pawn.current_position = 'e4'

    assert_equal({
                   straight_line_moves: %w[e5],
                   left_moves: ['d5'],
                   right_moves: ['f5']
                 }, @black_pawn.moves)

    @black_pawn.current_position = 'e8'
    assert_equal({ straight_line_moves: [], left_moves: [], right_moves: [] }, @black_pawn.moves)
  end
end
