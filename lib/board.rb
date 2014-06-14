class Board
  attr_reader :grid

  def initialize(grid = default_grid)
    @grid = grid
  end

  def mark_position(position, mark)
    raise Exception if !grid.include?(position)
    grid[position - 1] = mark
  end

  def winner?
    return true if grid[0..2] == ['X', 'X', 'X']
    false
  end

  private

  def default_grid
    (1..9).to_a
  end
end
