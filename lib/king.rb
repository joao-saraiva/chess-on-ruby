# frozen_string_literal: true

require_relative 'piece'
require 'byebug'

# This class is an abstration of a king piece in a game of chess.
# It may be able to map it moves, color, and current position
class King
  include Piece

  def to_s
    color == "black" ? "♔" : "♚"
  end

  def moves
    (top_moves + bottom_moves + left_moves + right_moves).sort
  end

  def king_on_check?
    move_puts_on_check?(current_position)
  end

  private

  def especial_attributes
    @signature = 'K'
  end

  def top_moves
    return [] if row_out_of_bounds?(next_row) || current_column.nil?

    one_move_top = construct_movement(current_column, next_row)
    moves = move_avaliable?(one_move_top) ? [one_move_top] : []
    push_left_and_right_moves(moves, left_column, right_column, next_row)
  end

  def bottom_moves
    return [] if row_out_of_bounds?(previous_row) || current_column.nil?

    one_move_bottom = construct_movement(current_column, previous_row)
    moves = move_avaliable?(one_move_bottom) ? [one_move_bottom] : []
    push_left_and_right_moves(moves, left_column, right_column, previous_row)
  end

  def push_left_and_right_moves(moves, left_column, right_column, row)
    moves.push((left_column + row.to_s)) if !left_column.nil? && move_avaliable?((left_column + row.to_s))
    moves.push((right_column + row.to_s)) if !right_column.nil? && move_avaliable?((right_column + row.to_s))

    moves
  end

  def right_moves
    return [] if right_column.nil? || !move_avaliable?((right_column + current_row.to_s))

    [(right_column + current_row.to_s)]
  end

  def left_moves
    return [] if left_column.nil? || !move_avaliable?((left_column + current_row.to_s))

    [(left_column + current_row.to_s)]
  end

  def move_puts_on_check?(king_move)
    enemy_pieces.reject{ |piece| piece.signature == "K" }.each do |piece|
      moves = piece.is_a?(Pawn) ? piece.attacking_moves : piece.moves
      moves.each do |move|
        return true if move == king_move
      end
    end

    false
  end

  def move_avaliable?(move)
    !ally_piece_blocking_move?(move) && !move_puts_on_check?(move)
  end
end
