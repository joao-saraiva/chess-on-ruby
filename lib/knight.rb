# frozen_string_literal: true

require_relative 'piece'

# This class is an abstration of a Knight piece in a game of chess.
# It may be able to map it moves, color, and current position
class Knight
  include Piece
  def moves
    { top_moves: top_moves, bottom_moves: bottom_moves }
  end

  private

  def especial_attributes
    @signature = 'N'
  end

  def jump_moves(movement_way)
    moves = []

    first_row_movements(moves, movement_way)
    second_row_movements(moves, movement_way)

    moves
  end

  def first_row(movement_way)
    movement_way == 'top' ? current_row + 1 : current_row - 1
  end

  def second_row(movement_way)
    movement_way == 'top' ? current_row + 2 : current_row - 2
  end

  def row_is_on_limit?(row, movement_way)
    return row <= 8 if movement_way == 'top'

    row >= 1
  end

  def first_row_movements(moves, movement_way)
    row = first_row(movement_way)
    return unless row_is_on_limit?(row, movement_way)

    double_left_column = left_column(2)
    double_right_column = right_column(2)

    moves.push(construct_movement(double_left_column, row)) unless double_left_column.nil?
    moves.push(construct_movement(double_right_column, row)) unless double_right_column.nil?
  end

  def second_row_movements(moves, movement_way)
    row = second_row(movement_way)
    return unless row_is_on_limit?(row, movement_way)

    moves.push(construct_movement(left_column, row)) unless left_column.nil?
    moves.push(construct_movement(right_column, row)) unless right_column.nil?
  end

  def top_moves
    jump_moves('top')
  end

  def bottom_moves
    jump_moves('bottom')
  end
end
