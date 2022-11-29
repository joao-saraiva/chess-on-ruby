# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/knight'

class KnightTest < MiniTest::Test
  def setup
    @black_knight = Knight.new("black")
  end

  def test_knight_assignment
    assert_equal 'N', @black_knight.signature
    assert_equal 'black', @black_knight.color
    assert_nil @black_knight.current_position
  end

  def test_moves
    assert_equal({top_moves: [], bottom_moves: []}, @black_knight.moves)

    @black_knight.current_position = "d4"
    assert_equal({top_moves: %w[b5 f5 c6 e6], bottom_moves: %w[b3 f3 c2 e2]}, @black_knight.moves)

    @black_knight.current_position = "d1"
    assert_equal({top_moves: %w[b2 f2 c3 e3], bottom_moves: []}, @black_knight.moves)

    @black_knight.current_position = "d8"
    assert_equal({top_moves: [], bottom_moves: %w[b7 f7 c6 e6]}, @black_knight.moves)

    @black_knight.current_position = "h1"
    assert_equal({top_moves: %w[f2 g3], bottom_moves: []}, @black_knight.moves)
  end
end