# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/chess_board'
require_relative '../lib/knight'

class KnightTest < MiniTest::Test
  def setup
    @chess_board = ChessBoard.new
    @black_knight = @chess_board.board[:b8]
  end

  def test_knight_assignment
    assert_equal 'N', @black_knight.signature
    assert_equal 'black', @black_knight.color
  end

  def test_moves
    assert_equal(%w[a6 c6], @black_knight.moves)

    @black_knight.current_position = "b3"

    assert_equal(%w[a1 a5 c1 c5 d2 d4 h2 h4], @black_knight.moves)
  end
end