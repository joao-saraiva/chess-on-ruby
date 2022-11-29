# frozen_string_literal: true

require_relative 'piece'

# This class is an abstration of a Knight piece in a game of chess.
# It may be able to map it moves, color, and current position
class Knight
  include Piece
  def moves
    {top_moves: top_moves, bottom_moves: bottom_moves}
  end

  private

  def especial_attributes
    @signature = "N"
  end

  def top_moves
    return [] if current_row == 8
    moves = []

    top_row = current_row + 1
    double_top_row = current_row + 2

    if top_row <= 8
      moves.push(construct_movement(left_column(2), top_row)) unless left_column(2).nil?
      moves.push(construct_movement(right_column(2), top_row)) unless right_column(2).nil?
    end

    if double_top_row <= 8
      moves.push(construct_movement(left_column, double_top_row)) unless left_column.nil?
      moves.push(construct_movement(right_column, double_top_row)) unless right_column.nil?
    end

    moves
  end

  def bottom_moves
    return [] if current_row == 1
    moves = []

    bottom_row = current_row - 1
    double_bottom_row = current_row - 2

    if bottom_row >= 1
      moves.push(construct_movement(left_column(2), bottom_row)) unless left_column(2).nil?
      moves.push(construct_movement(right_column(2), bottom_row)) unless right_column(2).nil?
    end

    if double_bottom_row >= 1
      moves.push(construct_movement(left_column, double_bottom_row)) unless left_column.nil?
      moves.push(construct_movement(right_column, double_bottom_row)) unless right_column.nil?
    end

    moves
  end
end
