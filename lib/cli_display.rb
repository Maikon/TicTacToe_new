class CliDisplay

  BOARD = <<-GRID
* | * | *
--|---|--
* | * | *
--|---|--
* | * | *
  GRID

  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
  end

  def greet_players
    @output.puts "Welcome to Tic Tac Toe!"
  end

  def ask_for_move
    @output.puts 'Choose a move from the available ones:'
    @input.gets.chomp
  end

  private

  def print_board(grid)
    board = BOARD.dup
    grid.each do |position|
      board.sub!('*', position.to_s)
    end
    @output.puts board
  end
end
