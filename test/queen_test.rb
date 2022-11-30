# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/queen"
require_relative "../lib/chess_board"

class QueenTest < MiniTest::Test
  def setup 
    @chess_board = ChessBoard.new
    @black_queen = @chess_board.board[:d8]
  end

  def test_assignment
    assert_equal 'Q', @black_queen.signature
    assert_equal 'black', @black_queen.color
  end

  def test_moves
    assert_equal([], @black_queen.moves)

    @black_queen.current_position = "a1"

    assert_equal(%w[a2 b1 b2], @black_queen.moves)
  end
end