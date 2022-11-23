# frozen_string_literal: true

require_relative 'piece'
require_relative 'line_piece'

# This class is an abstracion of a rook of chess
class Rook
  include Piece
  include LinePiece

  def moves
    {
      vertical_moves: vertical_moves,
      horizontal_moves: horizontal_moves
    }
  end

  private

  def especial_attributes
    @signature = 'R'
  end
end
