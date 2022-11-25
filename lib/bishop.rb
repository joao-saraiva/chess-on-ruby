# frozen_string_literal: true

require_relative 'diagonal_piece'
require_relative 'piece'

# This class is an abstration of a bishop piece in a game of chess.
# It may be able to map it moves, color, and current position
class Bishop
  include Piece
  include DiagonalPiece
  def moves
    {
      top_left: top_left,
      top_right: top_right,
      bottom_left: bottom_left,
      bottom_right: bottom_right
    }
  end

  private

  def especial_attributes
    @signature = 'B'
  end
end
