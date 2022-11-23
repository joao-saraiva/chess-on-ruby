# frozen_string_literal: true

require 'minitest/autorun'

require_relative '../lib/bishop'

class BishopTest < MiniTest::Test
  def setup
    @black_bishop = Bishop.new("black")
  end

  def test_bishop_assignment
    assert_equal 'B', @black_bishop.signature
    assert_equal 'black', @black_bishop.color
    assert_nil @black_bishop.current_position
  end
end