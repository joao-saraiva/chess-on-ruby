# frozen_string_literal: true

require_relative 'chess_board'
require 'byebug'

@chess_board = ChessBoard.new

until @chess_board.over?
  puts @chess_board.draw_board

  puts 'Select a piece'
  selected_position = gets.chomp

  @chess_board.selected_position = selected_position
  begin
    @chess_board.position_formated_correctly?
    @chess_board.selected_piece_on_turn?

    system 'clear'
    puts @chess_board.draw_board(@chess_board.selected_piece_avaliable_moves)
    puts 'Select a move'
    new_position = gets.chomp

    raise 'Move is not avaliable' unless @chess_board.selected_piece_avaliable_moves.include?(new_position)

    if @chess_board.king_on_check?
      player_is_moving_the_king = @chess_board.selected_piece.signature == 'K'
      @chess_board.king_still_on_check_with_move?(player_is_moving_the_king ? new_position : nil)
    end

    system 'clear'
    @chess_board.move_piece(new_position)
  rescue StandardError => e
    system 'clear'
    puts e.message
    next
  end
end
