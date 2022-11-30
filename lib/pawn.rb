# frozen_string_literal: true

require_relative 'piece'

# This class represents the abstractions of pawn on a chess game
# here you can find the pawn avaliables moves, color, and etc...
class Pawn
  include Piece
  attr_accessor :first_move

  def moves
    (straight_line_moves + left_moves + right_moves).uniq.sort
  end

  private

  def especial_attributes
    @first_move = true
    @signature = 'P'
  end

  def straight_line_moves
    return [] if current_position.nil? || row_out_of_bounds?(next_row_by_color)

    one_row_move = construct_movement(current_column, next_row_by_color)
    double_row_move = construct_movement(current_column, double_next_row_by_color)

    moves = piece_blocking_move?(one_row_move) ? [] : [one_row_move]
    moves.push(double_row_move) if first_move && !piece_blocking_move?(double_row_move)

    moves
  end

  def left_moves
    return [] unless contains_piece_on_side?(left_column)

    [(left_column + next_row_by_color.to_s).to_s]
  end

  def right_moves
    return [] unless contains_piece_on_side?(right_column)

    [(right_column + next_row_by_color.to_s).to_s]
  end

  def next_row_by_color
    color == 'black' ? previous_row : next_row
  end

  def double_next_row_by_color
    color == 'black' ? current_row - 2 : current_row + 2
  end

  def contains_piece_on_side?(column)
    !column.nil? && !row_out_of_bounds?(next_row_by_color) &&
      enemy_piece_blocking_move?((column + next_row_by_color.to_s))
  end
end
