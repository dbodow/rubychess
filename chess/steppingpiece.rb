module SteppingPiece

  def step_finder(dist)
    row, col = @position
    out = []
    (0..dist).each do |h_shift|
      (0..dist).each do |v_shift|
        if h_shift == dist || v_shift == dist
          out << [row + v_shift, col + h_shift]
          out << [row - v_shift, col + h_shift]
          out << [row + v_shift, col - h_shift]
          out << [row - v_shift, col - h_shift]
        end
      end
    end
    out.uniq!
    out.reject! { |pos| @board[pos].color == @color }
    out.select { |pos| Board.in_bounds(pos) }
  end

  def update_moves(distance)
    @moves = []
    case distance
    when 1 # it's a king
      @moves.concat(step_finder(1))
    when 2 # it's a knight
      candidates = step_finder(2)
      our_square_sum = @position.inject(&:+)
      # if the sum of a square's position indices is odd, the square is dark
      # if the sum of a square's position indices is even, the square is light
      # knights can only jump to square of the opposite color
      if our_square_sum.odd?
        @moves.concat(candidates.reject { |pos| pos.inject(&:+).odd? })
      else
        @moves.concat(candidates.reject { |pos| pos.inject(&:+).even? })
      end
    end

  end
end
