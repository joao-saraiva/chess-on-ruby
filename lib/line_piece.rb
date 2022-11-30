# frozen_string_literal: true

require 'byebug'

# This module is an abstratcion of piece of chess that can move the entire board at a horizon and vertical line
module LinePiece
  private

  def rows_until_first_piece_block(remaining_rows, remaining_rows_side)
    remaining_rows_side.each do |row|
      move = construct_movement(current_column, row)
      if piece_blocking_move?(move)
        remaining_rows.push(move) if enemy_piece_blocking_move?(move)
        break
      end

      remaining_rows.push(move)
    end
  end

  def columns_until_first_piece_block(remaining_columns, remaining_columns_side)
    remaining_columns_side.each do |column|
      move = construct_movement(column, current_row)
      if piece_blocking_move?(move)
        remaining_columns.push(move) if enemy_piece_blocking_move?(move)
        break
      end
      remaining_columns.push(move)
    end
  end

  def vertical_moves
    remaining_rows = []

    rows_until_first_piece_block(remaining_rows, top_rows_remaining)
    rows_until_first_piece_block(remaining_rows, bottom_rows_remaining)

    remaining_rows
  end

  def horizontal_moves
    remaining_columns = []

    columns_until_first_piece_block(remaining_columns, left_columns_remaining.reverse)
    columns_until_first_piece_block(remaining_columns, right_columns_remaining)

    remaining_columns
  end
end
