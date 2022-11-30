# frozen_string_literal: true

require_relative 'diagonal_piece'
require_relative 'piece'

# This class is an abstration of a bishop piece in a game of chess.
# It may be able to map it moves, color, and current position
class Bishop
  include Piece
  include DiagonalPiece

  def to_s
    color == 'black' ? '♗' : '♝'
  end

  def moves
    (top_left + top_right + bottom_left + bottom_right).sort
  end

  private

  def especial_attributes
    @signature = 'B'
  end
end
