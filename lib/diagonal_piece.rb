# frozen_string_literal: true

# This module represente an abstraction of classes that move at diagional positions
# in a game of chess (queen and bishop)
module DiagonalPiece
  private

  def moves_until_first_piece(moves, rows, columns)
    rows.each_with_index do |row, index|
      column = columns[index].to_s
      move = construct_movement(column, row)

      if piece_blocking_move?(move)
        moves.push(move) if enemy_piece_blocking_move?(move)
        break
      end

      moves.push(construct_movement(column, row))
    end

    moves
  end

  def diagonal_moves(rows_remaining, columns)
    return [] if rows_remaining.size.zero? || columns.size.zero?

    moves = []

    moves_until_first_piece(moves, rows_remaining, columns)
    moves.select { |m| m =~ /[a-z]\d/ }
  end

  def top_left
    diagonal_moves(top_rows_remaining, left_columns_remaining.reverse)
  end

  def top_right
    diagonal_moves(top_rows_remaining, right_columns_remaining)
  end

  def bottom_left
    diagonal_moves(bottom_rows_remaining, left_columns_remaining.reverse)
  end

  def bottom_right
    diagonal_moves(bottom_rows_remaining, right_columns_remaining)
  end
end
