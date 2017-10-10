require_relative 'cursor'
require 'colorize'

class Display

  RENDERMAP = {
    NilClass => ' ',
    Piece => 'p'
  }

  def initialize(cursor = Cursor.new )
    @cursor = cursor
  end

  def render
    to_print = @cursor.board.grid.map do |row|
      row.map do |el|
        RENDERMAP[el.class]                # update mapping as we update piece class
      end                       # i.e differentiate pieces by color
    end

    # highlight the cursor
    x,y = @cursor.cursor_pos
    to_print[x][y] = to_print[x][y].colorize(:color => :yellow, :background => :purple )


    to_print.each {|row| puts row }

  end

  def show
    loop do
      render
      @cursor.get_input
    end

  end

end
