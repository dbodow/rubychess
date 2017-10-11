require 'singleton'
require 'byebug'
require_relative 'slidingpiece'
require_relative 'steppingpiece'


class Piece

  attr_reader :moves, :color

  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color
    @moves = nil

  end

end

class King < Piece
  include SteppingPiece
end

class Knight < Piece
  include SteppingPiece
end

class Queen < Piece
  include SlidingPiece
end

class Rook < Piece
  include SlidingPiece
end

class Bishop < Piece
  include SlidingPiece
end

class Pawn < Piece
  def initialize(position, board, color)
    @moved = false
    super
  end

  def update_moves
    @moves = []
    x, y = @position


    #move 2 up
    unless @moved
      @moves << [x, y + 2] if @color == :black && @board[[x, y+2]].color == :empty && @board[[x, y+1]].color == :empty
      @moves << [x, y - 2] if @color == :white && @board[[x, y-2]].color == :empty && @board[[x, y-1]].color == :empty
    end

    # move one up
    @moves << [x, y + 1] if @color == :black && @board[[x, y+1]].color == :empty
    @moves << [x, y - 1] if @color == :white && @board[[x, y-1]].color == :empty

    @moves << [x+1,y+1]  # diagonal captures


  end


end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = :empty
  end

  def update_moves(*symbol); end

end
