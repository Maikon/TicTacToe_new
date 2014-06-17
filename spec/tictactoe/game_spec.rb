require 'tictactoe/game'
require 'tictactoe/board'
require 'tictactoe/fake_display'
require 'cli_display'
require 'spec_helper'

describe Game do
  let(:board)   { Board.new }
 # let(:output)  { StringIO.new }
 # let(:input)   { StringIO.new("1\n2\n") }
 # let(:display) { CliDisplay.new(output, input) }
  let(:display) { TicTacToe::FakeDisplay.new([1, 2]) }
  let(:game)    { Game.new(display, board) }

  it 'receives input from the user for a move' do
    expect(game.receive_user_input).to eq 1
    expect(game.receive_user_input).to eq 2
  end

  it 'alters the board based on user input' do
    game.mark_board_position
    expect(board.grid).to eq ['X', 2, 3, 4, 5, 6, 7, 8, 9]
  end

  it 'returns true if the move is valid, false otherwise' do
    expect(game.move_valid?(1)).to eq true
    expect(game.move_valid?('x')).to eq false
  end

  it 'does not alter the board if the input is invalid' do
    #input = StringIO.new("x\n2\n")
    #display = CliDisplay.new(output, input)
    display = TicTacToe::FakeDisplay.new([false, 2])
    game = Game.new(display, board)
    game.move_sequence
    expect(board.grid).to eq [1, 'X', 3, 4, 5, 6, 7, 8, 9]
  end

  xit "plays the game until there's a winner" do
    board = Board.new(['X', 2, 3, 4, 'O', 6, 7, 8, 9])
    input = StringIO.new("2\n4\n3\nn\n")
    display = CliDisplay.new(output, input)
    game = Game.new(display, board)
    game.start
    expect(board.grid).to eq ['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9]
  end

  xit "plays the game until there's a draw" do
    board = Board.new([1, 2, 3, 4, 'O', 'X', 'X', 'O', 'X'])
    input = StringIO.new("1\n4\n3\n2\nn\n")
    display = CliDisplay.new(output, input)
    game = Game.new(display, board)
    game.start
    expect(board.grid).to eq ['O', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'X']
  end

  xdescribe '#play_again?' do
    it 'prints farewell message when user choses not to play again' do
      input = StringIO.new("n\n")
      display = CliDisplay.new(output, input)
      game = Game.new(display)
      game.play_again?
      output.rewind
      expect(output.readlines[1]).to eq "Thanks for playing!\n"
    end
  end
end
