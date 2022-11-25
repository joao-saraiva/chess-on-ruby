# frozen_string_literal: true

require 'byebug'

# This module represente an abstraction of classes that move at diagional positions
# in a game of chess (queen and bishop)
module DiagonalPiece
  private

  def top_left
    diagonal_moves(top_rows_remaining, left_columns_remaining.reverse)
  end

  def top_right
    diagonal_moves(top_rows_remaining, right_columns_remaining)
  end

  def diagonal_moves(top_rows, columns)
    return [] if top_rows.size.zero? || columns.size.zero?

    moves = []

    top_rows.each_with_index do |row, index|
      column = columns[index].to_s
      moves.push(construct_movement(column, row))
    end

    moves.select { |m| m =~ /[a-z]\d/ }
  end

  def bottom_left
    diagonal_moves(bottom_rows_remaining, left_columns_remaining.reverse)
  end

  def bottom_right
    diagonal_moves(bottom_rows_remaining, right_columns_remaining)
  end

  def diagonal_inferior; end
end
