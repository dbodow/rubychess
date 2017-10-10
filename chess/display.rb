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

    to_print.each_with_index do |row, i |
      row.each_with_index do |ch, j |
        if (i + j).odd?
          to_print[i][j] = to_print[i][j].colorize(:color => :blue, :background => :white)
        else
          to_print[i][j] = to_print[i][j].colorize(:color => :blue, :background => :brown)
        end
      end
    end

    # highlight the cursor
    x,y = @cursor.cursor_pos
    to_print[x][y] = to_print[x][y].colorize(:color => :yellow, :background => :red )


    to_print.each { |row| print row.join(" ") + "\n" }

  end

  def show
    loop do
      puts "\e[H\e[2J"
      render
      @cursor.get_input
    end

  end

end
