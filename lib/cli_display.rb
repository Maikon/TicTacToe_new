class CliDisplay

  BOARD = <<-GRID
* | * | *
--|---|--
* | * | *
--|---|--
* | * | *
  GRID

  def initialize(output)
    @output = output
  end

  def greet_players
    @output.puts "Welcome to Tic Tac Toe!"
  end

  def print_board(grid)
    board = BOARD.dup
    grid.each do |position|
      board.sub!('*', position.to_s)
    end
    @output.puts board
  end
end
