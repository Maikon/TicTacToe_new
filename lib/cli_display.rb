class CliDisplay

  BOARD = <<-GRID
* | * | *
--|---|--
* | * | *
--|---|--
* | * | *
  GRID
  SPACING = '*' * 15

  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
  end

  def greet_players
    @output.puts SPACING
    @output.puts "Welcome to Tic Tac Toe!"
    @output.puts SPACING
  end

  def ask_for_move
    @output.puts 'Choose a move from the available ones:'
    @input.gets.chomp.to_i
  end

  def another_round?
    @output.puts 'Would you like to play again?'
    @input.gets.chomp
  end

  def print_board(grid)
    board = BOARD.dup
    grid.each do |position|
      board.sub!('*', position.to_s)
    end
    @output.puts board
  end
end
