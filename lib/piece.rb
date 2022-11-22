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

  def index_of_current_column
    COLUMNS.find_index(current_column)
  end

  def left_column
    return if index_of_current_column.nil?

    COLUMNS[index_of_current_column - 1]
  end

  def right_column
    return if index_of_current_column.nil?

    COLUMNS[index_of_current_column + 1]
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

  def top_rows_remaining
    return [] if current_row.zero? || current_row == 8

    (next_row..8).to_a
  end

  def bottom_rows_remaining
    return [] if current_row.zero? || current_row == 1

    (1..previous_row).to_a.reverse
  end

  def left_columns_remaining
    return [] if current_column.nil? || current_column == 'a'

    COLUMNS[0..(index_of_current_column - 1)]
  end

  def right_columns_remaining
    return [] if current_column.nil? || current_column == 'h'

    COLUMNS[(index_of_current_column + 1)..]
  end
end
