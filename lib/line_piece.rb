# frozen_string_literal: true

# This module is an abstratcion of piece of chess that can move the entire board at a horizon and vertical line
module LinePiece
  private

  def vertical_moves
    remaining_rows = (top_rows_remaining + bottom_rows_remaining).sort

    remaining_rows.map { |rr| (current_column + rr.to_s).to_s }
  end

  def horizontal_moves
    remaining_columns = (left_columns_remaining + right_columns_remaining).sort

    remaining_columns.map { |rc| rc + current_row.to_s }
  end
end
