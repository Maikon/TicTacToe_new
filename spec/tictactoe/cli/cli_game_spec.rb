require 'tictactoe/cli/cli_game'
require 'tictactoe/fake_display'

describe TicTacToe::CliGame do
  describe '#start' do
    it 'greets the players' do
      display = TicTacToe::FakeDisplay.new(false)
      runner = TicTacToe::CliGame.new(display)
      runner.start
      expect(display.output).to eq "Welcome to Tic Tac Toe!\n"
    end
  end
end
