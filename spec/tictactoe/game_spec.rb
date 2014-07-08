require 'tictactoe/game'
require 'tictactoe/board'
require 'spec_helper'

describe TicTacToe::Game do
  let(:board) { TicTacToe::Board.new }
  let(:game)  { TicTacToe::Game.new(board) }

  describe '#winner?' do
    it 'returns true if there is a winner' do
      board = TicTacToe::Board.new(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      game = TicTacToe::Game.new(board)
      expect(game.winner?).to eq true
    end

    it 'returns false if there is no winner' do
      expect(game.winner?).to eq false
    end
  end

  describe '#draw?' do
    it 'returns true if the game is a draw' do
      board = TicTacToe::Board.new(['X', 'X', 'O', 'O', 'X', 'X', 'X', 'O', 'O'])
      game = TicTacToe::Game.new(board)
      expect(game.draw?).to eq true
    end

    it 'returns false if the game is not a draw' do
      expect(game.draw?).to eq false
    end
  end

  describe '#over?' do
    it 'returns true if the game has reached an end state' do
      board = TicTacToe::Board.new(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      game = TicTacToe::Game.new(board)
      expect(game.over?).to eq true
    end

    it 'returns false if the game has not reached an end state' do
      expect(game.over?).to eq false
    end
  end

  describe '#play_next_move' do
    it 'marks the given position on the board' do
      game.play_next_move(1)
      expect(board.grid).to eq ['X', 2, 3, 4, 5, 6, 7, 8, 9]
      game.play_next_move(5)
      expect(board.grid).to eq ['X', 2, 3, 4, 'O', 6, 7, 8, 9]
    end
  end
end
