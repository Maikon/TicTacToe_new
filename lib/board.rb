class Board
  attr_reader :grid

  def initialize(grid = default_grid, board_size: 3)
    @grid = grid
    @board_size = board_size
  end

  def mark_position(position, mark)
    raise 'Position already taken' if !grid.include?(position)
    grid[position - 1] = mark
  end

  def winner?
    winning_combinations.any? { |combo| combo.all? { |cell| cell == combo.first } }
  end

  def available_moves
    grid.select { |cell| cell.is_a? Fixnum }
  end

  def current_mark
    available_moves.length.odd? ? 'X' : 'O'
  end

  def game_over?
    winner? || available_moves.empty?
  end

  private

  def winning_combinations
    rows + columns + diagonals
  end

  def rows
    grid.each_slice(@board_size).to_a
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
