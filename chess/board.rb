require 'byebug'
require_relative 'piece'
require 'colorize'
class InvalidMove < StandardError

end

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(4) {Array.new(8){nil} }
    2.times {@grid.unshift(Array.new(8){Piece.new})}  # white pieces
    2.times {@grid.push(Array.new(8){Piece.new})}     # black pieces
  end

  def move_piece(start_pos, end_pos)
    # debugger
    candidate_piece = self[start_pos]
    candidate_dest = self[end_pos]

    raise InvalidMove.new "No starting piece" if candidate_piece.nil?       # Create 'nil' piece
    raise InvalidMove.new "You can't move on top of a piece" if candidate_dest.is_a?(Piece)    # Update after we create 'nil' piece

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def in_bounds(pos)
    x,y = pos
    return false unless x.bewteen?(0,7) && y.bewteen(0,7)
    true
  end
end
