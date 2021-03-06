require 'tictactoe/cli/game'
require 'tictactoe/cli/display'

describe TicTacToe::CLI::Game do
    let(:output)  { StringIO.new }
    let(:input)   { StringIO.new("X\n2\ny\n1\n5\n2\n4\n3\nn\n") }
    let(:display) { TicTacToe::CLI::Display.new(output, input) }
    let(:game)    { TicTacToe::Game.new }
    let(:runner)  { TicTacToe::CLI::Game.new(display, game) }

  describe '#start' do
    it 'plays the game' do
      board = TicTacToe::Board.new(['X', 2, 'X', 'O', 'O', 6, 7, 8, 9])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CLI::Game.new(display, game)
      runner.start
      expect(game.board_grid).to eq ['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9]
    end
  end

  describe '#print_board' do
    it 'prints the board' do
      runner.print_board
      expect(output.string).to eq "1 | 2 | 3\n--|---|--\n4 | 5 | 6\n--|---|--\n7 | 8 | 9\n"
    end
  end

  describe '#valid_move' do
    it 'keeps asking user input until move is valid' do
      expect(runner.valid_move).to eq 2
    end
  end

  describe '#print_results' do
    it 'prints the winning message' do
      board = TicTacToe::Board.new(['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CLI::Game.new(display, game)
      runner.print_results
      expect(output.string).to eq "X won the game!\n"
    end

    it 'prints the message for a draw' do
      board = TicTacToe::Board.new(['X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O'])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CLI::Game.new(display, game)
      runner.print_results
      expect(output.string).to eq "The game is a draw\n"
    end
  end

  describe '#mark_position_with' do
    it 'makes a valid move on the board' do
      runner.mark_position_with(2)
      expect(game.board_grid).to eq [1, 'X', 3, 4, 5, 6, 7, 8, 9]
    end
  end

  describe '#reset_game_board' do
    it 'resets the game board' do
      runner.mark_position_with(2)
      expect(game.board_grid).to eq [1, 'X', 3, 4, 5, 6, 7, 8, 9]
      runner.reset_game_board
      expect(game.board_grid).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end
end
