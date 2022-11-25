# frozen_string_literal: true

require 'byebug'

# This module represente an abstraction of classes that move at diagional positions
# in a game of chess (queen and bishop)
module DiagonalPiece

  private

  def top_left
    top_moves(top_rows_remaining, left_columns_remaining.reverse)
  end

  def top_right
    top_moves(top_rows_remaining, right_columns_remaining)
  end

  def top_moves(top_rows, columns)
      return [] if top_rows.size == 0 || columns.size == 0

      moves = []
      top_rows.each_with_index do |row, index|
        column = columns[index]
        moves.push(construct_movement(column, row))
    end

    moves.select { |m| m =~ /[a-z]\d/ }
  end

  def bottom_left 
    []
  end

  def bottom_right
    []
  end

  def diagonal_inferior
  end
end
