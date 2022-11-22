# frozen_string_literal: true

# This represente the piece class, it contain the minimum attributes to be a chess piece
class Piece
  attr_accessor :current_position
  attr_reader :color, :signature

  def initialize(color)
    @color = color
    @signature = 'P'
    @first_move = true

    especial_attributes
  end

  def ==(other)
    color == other.color && @signature == other.signature && current_position == other.current_position
  end

  # Use this method in other class if your piece need an extra attribute
  def especial_attributes; end
end
