require 'cli_display'
require 'board'

describe CliDisplay do
  it 'greets the players' do
    output = StringIO.new
    display = CliDisplay.new(output)
    display.greet_players
    expect(output.string).to eq "Welcome to Tic Tac Toe!\n"
  end

  it 'prints the board' do
    output = StringIO.new
    display = CliDisplay.new(output)
    display.print_board(Board.new.grid)
    expect(output.string).to eq "1 | 2 | 3\n--|---|--\n4 | 5 | 6\n--|---|--\n7 | 8 | 9\n"
  end
end
