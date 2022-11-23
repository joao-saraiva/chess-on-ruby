# frozen_string_literal: true

require_relative 'king'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'


# This class represente the abstratcion of a chess board,
# it can draw the board, validate a play, move a piece
# and also define the winner
class ChessBoard
  attr_accessor :board

  def initialize
    @board = {
      a8: Rook.new('black'), b8: Knight.new('black'), c8: Bishop.new('black'), d8: Queen.new('black'), e8: King.new('black'), f8: Bishop.new('black'), g8: Knight.new('black'), h8: Rook.new('black'),
      a7: Pawn.new('black'), b7: Pawn.new('black'), c7: Pawn.new('black'), d7: Pawn.new('black'), e7: Pawn.new('black'), f7: Pawn.new('black'), g7: Pawn.new('black'), h7: Pawn.new('black'),
      a6: nil, b6: nil, c6: nil, d6: nil, e6: nil, f6: nil, g6: nil, h6: nil,
      a5: nil, b5: nil, c5: nil, d5: nil, e5: nil, f5: nil, g5: nil, h5: nil,
      a4: nil, b4: nil, c4: nil, d4: nil, e4: nil, f4: nil, g4: nil, h4: nil,
      a3: nil, b3: nil, c3: nil, d3: nil, e3: nil, f3: nil, g3: nil, h3: nil,
      a2: Pawn.new('white'), b2: Pawn.new('white'), c2: Pawn.new('white'), d2: Pawn.new('white'), e2: Pawn.new('white'), f2: Pawn.new('white'), g2: Pawn.new('white'), h2: Pawn.new('white'),
      a1: Rook.new('white'), b1: Knight.new('white'), c1: Bishop.new('white'), d1: Queen.new('white'), e1: King.new('white'), f1: Bishop.new('white'), g1: Knight.new('white'), h1: Rook.new('white')
    }
  end
end
