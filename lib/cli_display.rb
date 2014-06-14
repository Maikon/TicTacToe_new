class CliDisplay

  def initialize(output)
    @output = output
  end

  def greet_players
    @output.puts "Welcome to Tic Tac Toe!"
  end

  def print_board(grid)
    @output.puts "#{grid[0]} | #{grid[1]} | #{grid[2]}"
    @output.puts '--|---|--'
    @output.puts "#{grid[3]} | #{grid[4]} | #{grid[5]}"
    @output.puts '--|---|--'
    @output.puts "#{grid[6]} | #{grid[7]} | #{grid[8]}"
  end
end
