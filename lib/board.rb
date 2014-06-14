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
    winning_combinations.any? { |combo| combo.all? { |cell| cell == combo.first } }
  end


  private

  def winning_combinations
    rows + columns + diagonals
  end

  def rows
    [ [grid[0], grid[1], grid[2]],
      [grid[3], grid[4], grid[5]],
      [grid[6], grid[7], grid[8]] ]
  end

  def columns
    [ [grid[0], grid[3], grid[6]],
      [grid[1], grid[4], grid[7]],
      [grid[2], grid[5], grid[8]] ]
  end

  def diagonals
    [ [grid[0], grid[4], grid[8]],
      [grid[2], grid[4], grid[6]] ]
  end

  def default_grid
    (1..9).to_a
  end
end
