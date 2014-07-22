require 'tictactoe/computer'
require 'tictactoe/board'

describe TicTacToe::Computer do
  describe '#choose_mark' do
    it 'chooses O if available_moves is even' do
      board = TicTacToe::Board.new(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.mark).to eq 'O'
    end

    it 'chooses X if available_moves is odd' do
      board = TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.mark).to eq 'X'
    end
  end

  describe '#make_move' do
    it 'makes a move on the board' do
      board = TicTacToe::Board.new(['X', 2, 3, 'X', 'O', 6, 7, 8, 9])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      computer.make_move(board)
      expect(board.grid).to eq ['X', 2, 3, 'X', 'O', 6, 'O', 8, 9]
    end
  end

  describe '#minimax' do
    it 'marks the center' do
      board = TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 'X'])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 5
    end

    it 'returns winning move' do
      board = TicTacToe::Board.new(['X', 'X', 3, 'O', 5, 6, 'O', 8, 9])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 3
    end

    it 'returns move preventing loss' do
      board = TicTacToe::Board.new(['X', 'O', 3, 4, 'X', 6, 7, 8, 9])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 9
    end

    it 'returns move preventing diagonal fork' do
      board = TicTacToe::Board.new(['X', 2, 3, 4, 'O', 6, 7, 8, 'X'])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 2
    end

    it 'returns move preventing alternative diagonal fork' do
      board = TicTacToe::Board.new(['O', 2, 3, 4, 'X', 6, 7, 8, 'X'])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 3
    end

    it 'returns move preventing edge trap' do
      board = TicTacToe::Board.new([1, 'X', 3, 'X', 'O', 6, 7, 8, 9])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 1
    end

    it 'returns move preventing reverse edge trap' do
      board = TicTacToe::Board.new([1, 2, 3, 4, 'O', 'X', 7, 'X', 9])
      computer = TicTacToe::Computer.new
      computer.choose_mark(board)
      expect(computer.minimax(board)).to eq 3
    end
  end
end
