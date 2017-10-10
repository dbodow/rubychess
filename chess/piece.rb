class Piece

  def initialize(board, )
    @board = board

  end

  # moves:
  # returns an array of positions that are legal moves for self
  def moves

  end

end

module SlidingPiece

  # move_dirs: piece => symbol
  # ex: move_dirs(Bishop.new) => :diagonal
  # ex: move_dirs(Rook.new) => :cardinal
  # ex: move_dirs(Queen.new) => :both
  # Valid directions are: :diagonal, :cardinal, and :both
  def move_dirs

  end

end

module SteppingPice

end
