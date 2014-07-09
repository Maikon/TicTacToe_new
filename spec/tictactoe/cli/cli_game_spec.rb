require 'tictactoe/board'
require 'tictactoe/game'
require 'tictactoe/computer'
require 'tictactoe/fake_display'
require 'tictactoe/cli/cli_game'

describe TicTacToe::CliGame do
  describe '#start' do
    it "plays the game until there's a winner" do
      board = TicTacToe::Board.new(['X', 2, 3, 4, 'O', 6, 7, 8, 9])
      display = TicTacToe::FakeDisplay.new([1, 2, 4, 3])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CliGame.new(game, display)
      runner.start
      expect(board.grid).to eq ['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9]
    end

    it "offers to play around another round" do
      board = TicTacToe::Board.new([1, 2, 3, 4, 'O', 'X', 'X', 'O', 'X'])
      display = TicTacToe::FakeDisplay.new([1, 4, 3, 2])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CliGame.new(game, display)
      expect(runner).to receive(:print_winning_message?)
      expect(runner).to receive(:print_draw_message?)
      expect(runner).to receive(:play_another_around?)
      runner.start
    end
  end

  describe '#restart_game' do
    it "clears the screen and starts a new game" do
      board = TicTacToe::Board.new([1, 2, 3, 4, 'O', 'X', 'X', 'O', 'X'])
      display = TicTacToe::FakeDisplay.new([1, 4, 3, 2])
      game = TicTacToe::Game.new(board)
      runner = TicTacToe::CliGame.new(game, display)
      expect(game).to receive(:reset)
      expect(runner).to receive(:start)
      runner.restart_game
    end
  end
end
