# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/rook'
require_relative '../lib/chess_board'

class RookTest < MiniTest::Test
  def setup
    @chess_board = ChessBoard.new
    @black_rook = @chess_board.board[:h8]
  end

  def test_rook_assignment
    assert_equal 'R', @black_rook.signature
    assert_equal 'black', @black_rook.color
  end

  def test_moves
    assert_equal([], @black_rook.moves)

    @black_rook.current_position = 'd4'

    assert_equal(%w[a4 b4 c4 d2 d3 d5 d6 e4 f4 g4 h4], @black_rook.moves)
  end
end
