# frozen_string_literal: true

require 'minitest/autorun'
require 'byebug'
require_relative '../lib/king'
require_relative '../lib/chess_board'

class KingTest < MiniTest::Test
  def setup
    @chess_board = ChessBoard.new
    @black_king = @chess_board.board[:e8]
  end

  def test_king_assignment
    assert_equal 'K', @black_king.signature
    assert_equal 'black', @black_king.color
  end

  def test_moves
    assert_equal([], @black_king.moves)

    @black_king.current_position = 'd4'

    assert_equal(%w[c4 c5 d5 e4 e5], @black_king.moves)
  end
end
