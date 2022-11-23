# frozen_string_literal: true

require_relative 'king'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'
require_relative 'board_initial'

# This class represente the abstratcion of a chess board,
# it can draw the board, validate a play, move a piece
# and also define the winner
class ChessBoard
  include BoardInitial
  attr_accessor :board

  def initialize
    @board = START_BOARD
  end
end
