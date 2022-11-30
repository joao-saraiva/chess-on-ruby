# frozen_string_literal: true

require 'minitest/autorun'
require 'byebug'
require_relative '../lib/pawn'
require_relative '../lib/chess_board'

class PawnTest < MiniTest::Test
  def setup
    @chess_board = ChessBoard.new
    @black_pawn = @chess_board.board[:e7]
    @white_pawn = @chess_board.board[:d2]
  end

  def test_pawmn_assignment
    assert_equal 'P', @black_pawn.signature
    assert_equal 'black', @black_pawn.color
  end

  def test_moves
    assert_equal(%w[e5 e6], @black_pawn.moves)

    @black_pawn.current_position = 'e5'
    @black_pawn.first_move = false
    @white_pawn.current_position = 'd4'

    assert_equal(%w[d4 e4], @black_pawn.moves)

    @black_pawn.current_position = 'e4'

    assert_equal(%w[e3], @black_pawn.moves)

    @black_pawn.current_position = 'e8'
    assert_equal(%w[e7], @black_pawn.moves)
  end
end
