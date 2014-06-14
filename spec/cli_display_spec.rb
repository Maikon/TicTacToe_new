require 'cli_display'
require 'board'

describe CliDisplay do
  let(:output) { StringIO.new }
  let(:display) { CliDisplay.new(output) }

  it 'greets the players' do
    display.greet_players
    expect(output.string).to eq "***************\nWelcome to Tic Tac Toe!\n***************\n"
  end

  it 'prints the board' do
    display.print_board(Board.new.grid)
    expect(output.string).to eq "1 | 2 | 3\n--|---|--\n4 | 5 | 6\n--|---|--\n7 | 8 | 9\n"
  end

  it 'asks the player for a move and returns the input' do
    input = StringIO.new("1\n")
    display = CliDisplay.new(output, input)
    expect(display.ask_for_move).to eq 1
    expect(output.string).to eq "Choose a move from the available ones:\n"
  end

  it 'asks the player for another round and returns the input' do
    input = StringIO.new("y\n")
    output = StringIO.new
    display = CliDisplay.new(output, input)
    expect(display.another_round?).to eq 'y'
    expect(output.string).to eq "Would you like to play again?\n"
  end
end
