require 'tictactoe/game'
require 'tictactoe/board'
require 'spec_helper'

describe TicTacToe::Game do
  describe '#winner?' do
    it 'returns true if the board has a winner' do
      board = TicTacToe::Board.new(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      game = TicTacToe::Game.new(board)
      expect(game.winner?).to eq true
    end

    it 'returns false if the board has no winner' do
      board = TicTacToe::Board.new
      game = TicTacToe::Game.new(board)
      expect(game.winner?).to eq false
    end
  end
end
