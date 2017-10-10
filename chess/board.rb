require 'byebug'
require_relative 'piece'
require 'colorize'
class InvalidMove < StandardError

end

class Board
  attr_reader :grid

  # refactor to set up the correct piece in the correct position
  def initialize
    @grid = Array.new(8) {Array.new(8){NullPiece.instance} }

    (0..1).each do |row|
      (0..7).each do |col|
        self[[row,col]] = Rook.new([row,col],self, :white )
      end
    end

    (6..7).each do |row|
      (0..7).each do |col|
        self[[row,col]] = Rook.new([row,col],self, :black )
      end
    end

    # 2.times do |row|
    # # 2.times {@grid.unshift(Array.new(8){Rook.new( ,self,:white)})}  # white pieces  #currently no position for rook
    #
    # 2.times {@grid.push(Array.new(8){Rook.new( , self, :black)})}     # black pieces # currently no position for rook
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

  def self.in_bounds(pos)
    x,y = pos
    return false unless x.between?(0,7) && y.between?(0,7)
    true
  end
end
