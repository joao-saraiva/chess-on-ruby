# frozen_string_literal: true

require_relative 'piece'

class King < Piece
  def moves
    {
      top_moves: top_moves,
      bottom_moves: bottom_moves,
      left_moves: left_moves,
      right_moves: right_moves
    }
  end

  private

  def especial_attributes
    @signature = 'K'
  end

  def top_moves
    return [] if row_out_of_bounds?(next_row) || current_column.nil?

    moves = [(current_column + next_row.to_s)]
    moves.push((left_column + next_row.to_s)) unless left_column.nil?
    moves.push((right_column + next_row.to_s)) unless right_column.nil?
    moves
  end

  def bottom_moves
    return [] if row_out_of_bounds?(previous_row) || current_column.nil?

    moves = [(current_column + previous_row.to_s)]
    moves.push((left_column + previous_row.to_s)) unless left_column.nil?
    moves.push((right_column + previous_row.to_s)) unless right_column.nil?
    moves
  end

  def right_moves
    return [] if right_column.nil?

    [(right_column + current_row.to_s)]
  end

  def left_moves
    return [] if left_column.nil?

    [(left_column + current_row.to_s)]
  end
end
