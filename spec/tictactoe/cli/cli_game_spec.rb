require 'tictactoe/cli/cli_game'
require 'tictactoe/cli/cli_display'

describe TicTacToe::CliGame do
    let(:output)  { StringIO.new }
    let(:input)   { StringIO.new("X\n2\n") }
    let(:display) { TicTacToe::CliDisplay.new(output, input) }
    let(:game)    { TicTacToe::Game.new }
    let(:runner)  { TicTacToe::CliGame.new(display, game) }

  describe '#start' do
    it 'greets the players' do
      runner.start
      expect(output.string).to eq "***************\nWelcome to Tic Tac Toe!\n***************\n"
    end
  end

  describe '#print_board' do
    it 'prints the board' do
      runner.print_board
      expect(output.string).to eq "1 | 2 | 3\n--|---|--\n4 | 5 | 6\n--|---|--\n7 | 8 | 9\n"
    end
  end

  describe '#validate_move' do
    it 'keeps asking user input until move is valid' do
      expect(runner.validate_move).to eq 2
    end
  end

  describe '#print_results' do
    it 'prints the winning message' do
      board = TicTacToe::Board.new(['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CliGame.new(display, game)
      runner.print_results
      expect(output.string).to eq "X won the game!\n"
    end

    it 'prints the message for a draw' do
      board = TicTacToe::Board.new(['X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O'])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CliGame.new(display, game)
      runner.print_results
      expect(output.string).to eq "The game is a draw\n"
    end
  end
end
