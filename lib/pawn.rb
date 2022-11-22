# frozen_string_literal: true

require_relative 'piece'

# This class represents the abstractions of pawn on a chess game
# here you can find the pawn avaliables moves, color, and etc...
class Pawn < Piece
  attr_accessor :first_move

  COLUMNS = %w[a b c d e f g h].freeze

  def moves
    {
      straight_line_moves: straight_line_moves,
      left_moves: left_moves,
      right_moves: right_moves
    }
  end

  private

  def especial_attributes
    @first_move = true
  end

  def current_row
    current_position[-1].to_i
  rescue StandardError
    nil
  end

  def current_column
    current_position[0]
  rescue StandardError
    nil
  end

  def straight_line_moves
    return [] if current_position.nil?

    moves = [(current_column + (current_row + 1).to_s).to_s]
    moves.push((current_column + (current_row + 2).to_s).to_s) if first_move

    moves
  end

  def left_moves
    left_letter.nil? ? [] : [(left_letter + (current_row + 1).to_s).to_s]
  end

  def right_moves
    right_letter.nil? ? [] : [(right_letter + (current_row + 1).to_s).to_s]
  end

  def left_letter
    letter_index = COLUMNS.find_index(current_column)
    return if letter_index.nil?

    COLUMNS[letter_index - 1]
  end

  def right_letter
    letter_index = COLUMNS.find_index(current_column)
    return if letter_index.nil?

    COLUMNS[letter_index + 1]
  end
end
