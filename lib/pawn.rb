# frozen_string_literal: true

require_relative 'piece'

# This class represents the abstractions of pawn on a chess game
# here you can find the pawn avaliables moves, color, and etc...
class Pawn
  include Piece
  attr_accessor :first_move

  def moves
    {
      straight_line_moves: straight_line_moves,
      left_moves: left_moves,
      right_moves: right_moves
    }
  end

  private

  def especial_attributes
    @first_move = true
    @signature = 'P'
  end

  def straight_line_moves
    return [] if current_position.nil? || row_out_of_bounds?(next_row)

    moves = [(current_column + next_row.to_s)]
    moves.push((current_column + (current_row + 2).to_s)) if first_move

    moves
  end

  def left_moves
    left_column.nil? || row_out_of_bounds?(next_row) ? [] : [(left_column + next_row.to_s).to_s]
  end

  def right_moves
    right_column.nil? || row_out_of_bounds?(next_row) ? [] : [(right_column + next_row.to_s).to_s]
  end
end
