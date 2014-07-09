require 'tictactoe/board'
require 'tictactoe/game'
require 'tictactoe/computer'
require 'tictactoe/fake_display'
require 'tictactoe/cli/cli_game'

describe TicTacToe::CliGame do
  describe '#start' do
    it "plays the game until there's a winner" do
      board = TicTacToe::Board.new(['X', 2, 3, 4, 'O', 6, 7, 8, 9])
      display = TicTacToe::FakeDisplay.new([1, 2, 4, 3, "n/n"])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CliGame.new(game, display)
      runner.start
      expect(board.grid).to eq ['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9]
    end
  end
end
