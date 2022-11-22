# frozen_string_literal: true

# This represente the piece class, it contain the minimum attributes to be a chess piece
class Piece
  attr_accessor :current_position
  attr_reader :color, :signature

  COLUMNS = %w[a b c d e f g h].freeze

  def initialize(color)
    @color = color
    @first_move = true

    especial_attributes
  end

  def ==(other)
    color == other.color && @signature == other.signature && current_position == other.current_position
  end

  private

  # Use this method in other class if your piece need an extra attribute
  def especial_attributes; end

  def current_row
    current_position[-1].to_i
  rescue StandardError
    0
  end

  def current_column
    current_position[0]
  rescue StandardError
    nil
  end

  def left_column
    letter_index = COLUMNS.find_index(current_column)
    return if letter_index.nil?

    COLUMNS[letter_index - 1]
  end

  def right_column
    letter_index = COLUMNS.find_index(current_column)
    return if letter_index.nil?

    COLUMNS[letter_index + 1]
  end

  def next_row
    current_row + 1
  end

  def previous_row
    current_row - 1
  end

  def row_out_of_bounds?(row)
    row > 8 || row < 1
  end
end
