# frozen_string_literal: true

require_relative 'piece'
require_relative 'line_piece'

# This class is an abstration of a Rook piece in a game of chess.
# It may be able to map it moves, color, and current position
class Rook
  include Piece
  include LinePiece

  def moves
    (vertical_moves + horizontal_moves).uniq.sort
  end

  private

  def especial_attributes
    @signature = 'R'
  end
end
