require 'singleton'
require 'byebug'


module SlidingPiece
  # it takes a direction symbol
  # side:effect -> updates the @moves array with legal moves
  def update_moves(direction)
    @moves = []
    case direction
    when :cardinal
      # byebug
      @moves.concat(self.horizontal_moves)
      @moves.concat(self.vertical_moves)
    when :diagonal
      @moves.concat(self.diagonal_up_moves)
      @moves.concat(self.diagonal_down_moves)
    when :both
      @moves.concat(self.horizontal_moves)
      @moves.concat(self.vertical_moves)
      @moves.concat(self.diagonal_up_moves)
      @moves.concat(self.diagonal_down_moves)
    end

  end

  # return an array of legal horizontal moves from piece's position
  def horizontal_moves
    h_moves = []
    # byebug
    row, col = @position
    # left moves
    (col - 1).downto(0) do |col_i|
      case @board[[row, col_i]].color
      when :empty
        h_moves << [row, col_i]
      when @color # same color (blocked by self)
        break
      else # opponent color (capture piece)
        h_moves << [row, col_i]
        break
      end

    end

    # right moves
    (col + 1).upto(7) do |col_i|
      case @board[[row, col_i]].color
      when :empty
        h_moves << [row, col_i]
      when @color # same color (blocked by self)
        break
      else # opponent color (capture piece)
        h_moves << [row, col_i]
        break
      end

    end
    h_moves.select { |move| Board.in_bounds(move) }
  end

  #return an array of legal vertical moves from piece's position
  def vertical_moves
    v_moves = []

    row, col = @position
    # down moves
    (row - 1).downto(0) do |row_i|
      case @board[[row_i, col]].color
      when :empty
        v_moves << [row_i, col]
      when @color # same color (blocked by self)
        break
      else # opponent color (capture piece)
        v_moves << [row_i, col]
        break
      end

    end

    # up moves
    (row + 1).upto(7) do |row_i|
      case @board[[row_i, col]].color
      when :empty
        v_moves << [row_i, col]
      when @color # same color (blocked by self)
        break
      else # opponent color (capture piece)
        v_moves << [row_i, col]
        break
      end

    end

    v_moves.select { |move| Board.in_bounds(move) }

  end

  #return an array of legal diagnol up / moves from piece's position
  def diagonal_up_moves
    d_up = []
    row, col = @position

    #finding moves above the starting point
    row_i, col_i = row, col
    while Board.in_bounds([row_i, col_i])
      row_i -= 1
      col_i += 1
      case @board[[row_i, col_i]].color
      when :empty
        d_up << [row_i, col_i]
      when @color # same color (blocked by self)
        break
      else # opponent color (capture piece)
        d_up << [row_i, col_i]
        break
      end
    end

    #finding moves below the starting point
    row_i, col_i = row, col
    while Board.in_bounds([row_i, col_i])
      row_i += 1
      col_i -= 1
      case @board[[row_i, col_i]].color
      when :empty
        d_up << [row_i, col_i]
      when @color # same color (blocked by self)
        break
      else # opponent color (capture piece)
        d_up << [row_i, col_i]
        break
      end
    end

    d_up

  end

  #return an array of legal diagonal down \ moves from piece's position
  def diagonal_down_moves
    d_down = []
    row, col = @position

    #finding moves above the starting point
    row_i, col_i = row, col
    while Board.in_bounds([row_i, col_i])
      row_i -= 1
      col_i -= 1
      case @board[[row_i, col_i]].color
      when :empty
        d_down << [row_i, col_i]
      when @color # same color (blocked by self)
        break
      else # opponent color (capture piece)
        d_down << [row_i, col_i]
        break
      end
    end

    #finding moves below the starting point
    row_i, col_i = row, col
    while Board.in_bounds([row_i, col_i])
      row_i += 1
      col_i += 1
      case @board[[row_i, col_i]].color
      when :empty
        d_down << [row_i, col_i]
      when @color # same color (blocked by self)
        break
      else # opponent color (capture piece)
        d_down << [row_i, col_i]
        break
      end
    end

    d_down

  end

  # move_dirs: piece => symbol
  # ex: move_dirs(Bishop.new) => :diagonal
  # ex: move_dirs(Rook.new) => :cardinal
  # ex: move_dirs(Queen.new) => :both
  # Valid directions are: :diagonal, :cardinal, and :both
  def move_dirs(piece)
    case piece.class
    when Queen
      :both
    when Rook
      :cardinal
    when Bishop
      :diagonal
    end
  end

end


class Piece

  attr_reader :moves, :color

  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color
    @moves = nil

  end

  # moves: nil => array of positions
  # returns an array of positions that are legal moves for self

end

class King < Piece; end
class Knight < Piece; end
class Queen < Piece
  include SlidingPiece
end
class Rook < Piece
  include SlidingPiece
end
class Bishop < Piece
  include SlidingPiece
end

class Pawn < Piece; end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = :empty
  end

  def update_moves(*symbol); end

end



module SteppingPice

end
