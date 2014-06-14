class Board
  attr_reader :grid

  def initialize
    @grid = (1..9).to_a
  end

  def mark_position(position, mark)
    raise Exception if !grid.include?(position)
    grid[position - 1] = mark
  end
end
