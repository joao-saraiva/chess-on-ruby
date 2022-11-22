# frozen_string_literal: true

require 'minitest/autorun'

require_relative '../lib/chess_board'
require_relative '../lib/king'
require_relative '../lib/queen'
require_relative '../lib/rook'
require_relative '../lib/bishop'
require_relative '../lib/knight'
require_relative '../lib/pawn'

class ChessBoardTest < MiniTest::Test
  def setup
    @chess_board = ChessBoard.new
  end

  def test_board_is_initialized_with_pieces
    assert_equal(
      {
        a8: Rook.new('black'), b8: Knight.new('black'), c8: Bishop.new('black'), d8: Queen.new('black'), e8: King.new('black'), f8: Bishop.new('black'), g8: Knight.new('black'), h8: Rook.new('black'),
        a7: Pawn.new('black'), b7: Pawn.new('black'), c7: Pawn.new('black'), d7: Pawn.new('black'), e7: Pawn.new('black'), f7: Pawn.new('black'), g7: Pawn.new('black'), h7: Pawn.new('black'),
        a6: nil, b6: nil, c6: nil, d6: nil, e6: nil, f6: nil, g6: nil, h6: nil,
        a5: nil, b5: nil, c5: nil, d5: nil, e5: nil, f5: nil, g5: nil, h5: nil,
        a4: nil, b4: nil, c4: nil, d4: nil, e4: nil, f4: nil, g4: nil, h4: nil,
        a3: nil, b3: nil, c3: nil, d3: nil, e3: nil, f3: nil, g3: nil, h3: nil,
        a2: Pawn.new('white'), b2: Pawn.new('white'), c2: Pawn.new('white'), d2: Pawn.new('white'), e2: Pawn.new('white'), f2: Pawn.new('white'), g2: Pawn.new('white'), h2: Pawn.new('white'),
        a1: Rook.new('white'), b1: Knight.new('white'), c1: Bishop.new('white'), d1: Queen.new('white'), e1: King.new('white'), f1: Bishop.new('white'), g1: Knight.new('white'), h1: Rook.new('white')
      }, @chess_board.board
    )
  end
end
