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
    return true if rows.any? { |row| row.all? { |cell| cell == row.first } }
    return true if columns.any? { |row| row.all? { |cell| cell == row.first } }
    false
  end


  private

  def rows
    [ [grid[0], grid[1], grid[2]],
      [grid[3], grid[4], grid[5]],
      [grid[6], grid[7], grid[8]]
    ]
  end

  def columns
    [ [grid[0], grid[3], grid[6]],
      [grid[1], grid[4], grid[7]],
      [grid[2], grid[5], grid[8]],
    ]

  end

  def default_grid
    (1..9).to_a
  end
end
