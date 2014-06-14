class CliDisplay

  def initialize(output)
    @output = output
  end

  def greet_players
    @output.puts "Welcome to Tic Tac Toe!"
  end
end
