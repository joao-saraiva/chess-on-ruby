# frozen_string_literal: false

require_relative 'king'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'
require_relative 'board_initial'

require 'colorized_string'
require 'byebug'

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

  def selected_piece
    @board[selected_position.to_sym]
  end

  def selected_piece_moves
    return {} if selected_piece.nil?

    selected_piece.moves
  end

  def selected_piece_avaliable_moves
    return {} if selected_piece.nil?

    selected_piece.moves
  end

  def position_formated_correctly?
    correct_format = selected_position.size == 2 && selected_position[0] =~ /[a-h]/ && selected_position[1] =~ /[0-9]/

    raise "This position #{selected_position} does not exist" unless correct_format

    correct_format
  end

  def move_piece(new_position)
    return unless selected_piece_avaliable_moves.include?(new_position)

    piece_on_new_position = @board[new_position.to_sym]
    piece_on_new_position.current_position = nil unless piece_on_new_position.nil?
    @board[new_position.to_sym] = selected_piece
    selected_piece.current_position = new_position

    remove_pawn_first_move if selected_piece.is_a? Pawn
    clean_selected_position
    switch_turn
  end

  def selected_piece_on_turn?
    raise 'This is not your piece' if selected_piece.color != @turn

    true
  end

  def king_on_check?
    current_king.king_on_check?
  end

  def draw_board(with_options = [])
    draw = ''

    draw << '     a   b   c   d   e   f   g   h '
    draw << "\n "

    @board.each do |key, value|
      formated_key = key.to_s
      first_column = formated_key[0] == 'a'
      last_column = formated_key[0] == 'h'

      draw << " #{formated_key[1]} | " if first_column

      draw << if value.nil?
                if with_options.include?(formated_key)
                  '?? | '
                else
                  '  | '
                end
              else
                "#{value} | "
              end

      draw << "\n " if last_column
    end

    draw << '     a   b   c   d   e   f   g   h '
  end

  def over?
    return false unless king_on_check?

    current_king.ally_pieces.push(current_king).each do |ally_piece|
      moves = ally_piece.is_a?(Pawn) ? ally_piece.attacking_moves : ally_piece.moves
      return false if moves.any? { |move| !king_still_on_check_with_move?(ally_piece, move) }
    end

    true
  end

  def king_still_on_check_with_move?(piece, move)
    old_position = piece.current_position

    piece.current_position = move

    if piece != current_king
      enemy_piece_treat = @board[move.to_sym]
      enemy_piece_treat.current_position = nil unless enemy_piece_treat.nil?
    end

    if current_king.king_on_check?
      piece.current_position = old_position
      enemy_piece_treat.current_position = move if defined?(enemy_piece_treat) && !enemy_piece_treat.nil?
      return true
    end

    piece.current_position = old_position
    false
  end

  def selected_piece_exist?
    return true unless selected_piece.nil?

    raise 'This place is empty, please select again'
  end

  def validate_play
    selected_piece_exist?
    position_formated_correctly?
    selected_piece_on_turn?
  end

  private

  def remove_pawn_first_move
    selected_piece.first_move = false
  end

  def current_king
    @pieces.detect { |piece| piece.signature == 'K' && piece.color == @turn }
  end

  def clean_selected_position
    @board[selected_position.to_sym] = nil
    @selected_position = nil
  end

  def switch_turn
    @turn = @turn == 'white' ? 'black' : 'white'
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
