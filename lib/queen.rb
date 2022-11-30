# frozen_string_literal: true

require_relative 'piece'
require_relative 'diagonal_piece'
require_relative 'line_piece'

# This class is an abstration of a Queen piece in a game of chess.
# It may be able to map it moves, color, and current position
class Queen
  include Piece
  include DiagonalPiece
  include LinePiece

  def to_s
    color == 'black' ? '♕' : '♛'
  end

  def moves
    (vertical_moves + horizontal_moves + top_left + top_right + bottom_left + bottom_right).sort
  end

  private

  def especial_attributes
    @signature = 'Q'
  end
end
