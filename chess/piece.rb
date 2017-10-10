class Piece

  def initialize(position, board, color)
    @oosition = position
    @board = board
    @color = color
  end

  # moves: nil => array of positions
  # returns an array of positions that are legal moves for self
  def moves

  end

end

class King < Piece; end
class Knight < Piece; end
class Queen < Piece; end
class Rook < Piece; end
class Bishop < Piece; end

class Pawn < Piece; end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = :empty
  end
end


module SlidingPiece
  # it takes a direction symbol
  # side:effect -> updates the @moves array with legal moves
  def update_moves(direction)
    @moves = []
    case direction
    when :cardinal
      @moves << self.horizontal_moves
      @moves << self.vertical_moves
    when :diagonal
      @moves << self.diagonal_up_moves
      @moves << self.diagonal_down_moves
    when :both
      @moves << self.horizontal_moves
      @moves << self.vertical_moves
      @moves << self.diagonal_up_moves
      @moves << self.diagonal_down_moves
    end
  end

  #return an array of legal horizontal moves from piece's position
  def horizontal_moves

  end

  #return an array of legal vertical moves from piece's position
  def vertical_moves

  end

  #return an array of legal diagnol up / moves from piece's position
  def diagonal_up_moves
  end

  #return an array of legal diagonal down \ moves from piece's position
  def diagonal_down_moves
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

module SteppingPice

end
