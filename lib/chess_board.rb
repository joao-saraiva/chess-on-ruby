# frozen_string_literal: true

require_relative 'king'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'
require_relative 'board_initial'

# This class represent the abstratcion of a chess board,
# it can draw the board, validate a play, move a piece
# and also define the winner
class ChessBoard
  include BoardInitial
  attr_accessor :board, :turn, :selected_position, :pieces

  def initialize
    @pieces = []
    @board = START_BOARD
    instance_board_on_pieces
    @turn = 'white'
  end

  def select_piece
    @board[selected_position]
  end

  def selected_piece_moves
    return {} if select_piece.nil?

    select_piece.moves
  end

  def selected_piece_avaliable_moves
    return {} if select_piece.nil?

    select_piece.moves
  end

  def position_formated_correctly?
    correct_format = selected_position.size == 2 && selected_position[0] =~ /[a-h]/ && selected_position[1] =~ /[0-9]/

    raise "This position #{selected_position} does not exist" unless correct_format

    correct_format
  end

  private

  def king_avaliable_moves
    king_moves = selected_piece_moves

    king_moves.each do |key, moves|
      moves.each do |move|
        invalid_move = piece_blocking_move?(move) || move_puts_king_on_check?(move)
        king_moves[key].delete(move) if invalid_move
      end
    end
  end

  def instance_board_on_pieces
    @board.each do |_key, value|
      unless value.nil?
        value.board = self
        pieces.push(value)
      end
    end
  end
end
