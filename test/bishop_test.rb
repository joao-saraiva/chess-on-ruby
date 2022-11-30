# frozen_string_literal: true

require 'minitest/autorun'

require_relative '../lib/bishop'
require_relative '../lib/chess_board'

class BishopTest < MiniTest::Test
  def setup
    @chess_board = ChessBoard.new
    @black_bishop = @chess_board.board[:c8]
  end

  def test_bishop_assignment
    assert_equal 'B', @black_bishop.signature
    assert_equal 'black', @black_bishop.color
  end

  def test_moves
    assert_equal([], @black_bishop.moves)

    @black_bishop.current_position = "d4"

    assert_equal(%w[b2 b6 c3 c5 e3 e5 f2 f6], @black_bishop.moves)
  end
end