# frozen_string_literal: true

require_relative 'chess_board'
require 'byebug'

@chess_board = ChessBoard.new

until @chess_board.over?
  puts @chess_board.draw_board
  puts 'Select a piece'

  @chess_board.selected_position = gets.chomp

  begin
    @chess_board.validate_play
    system 'clear'
    puts @chess_board.draw_board(@chess_board.selected_piece_avaliable_moves)

    puts 'Select a move'
    new_position = gets.chomp

    raise 'Move is not avaliable' unless @chess_board.selected_piece_avaliable_moves.include?(new_position)

    if @chess_board.king_on_check? && @chess_board.king_still_on_check_with_move?(@chess_board.selected_piece,
                                                                                  new_position)
      raise 'Your King is on check'
    end

    system 'clear'
    @chess_board.move_piece(new_position)
  rescue StandardError => e
    system 'clear'
    puts e.message
    next
  end
end

puts @chess_board.draw_board

puts 'End of the game'
