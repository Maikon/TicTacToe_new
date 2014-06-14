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
    grid.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    [] <<  rows.map.with_index { |row, index| row[index] } << rows.reverse.map.with_index { |row, index| row[index] }
  end

  def default_grid
    (1..9).to_a
  end
end
