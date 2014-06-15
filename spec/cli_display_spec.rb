require 'cli_display'
require 'tictactoe/board'
require 'spec_helper'

describe CliDisplay do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\ny\n") }
  let(:display) { CliDisplay.new(output, input) }

  it 'greets the players' do
    display.greet_players
    expect(output.string).to eq "***************\nWelcome to Tic Tac Toe!\n***************\n"
  end

  it 'prints the board' do
    display.print_board(Board.new.grid)
    expect(output.string).to eq "1 | 2 | 3\n--|---|--\n4 | 5 | 6\n--|---|--\n7 | 8 | 9\n"
  end

  it 'asks the player for a move and returns the input' do
    expect(display.ask_for_move).to eq 1
    expect(output.string).to eq "Choose a move from the available ones:\n"
  end

  it 'asks the player for another round and returns the input' do
    input.gets
    expect(display.another_round?).to eq 'y'
    expect(output.string).to eq "Would you like to play again?\n"
  end

  it 'prints a farewell message when the game is over' do
    display.print_farewell_message
    expect(output.string).to eq "Thanks for playing!\n"
  end

  it 'prints the current mark' do
    display.current_mark('X')
    expect(output.string).to eq "It's X's turn now\n"
  end
end
