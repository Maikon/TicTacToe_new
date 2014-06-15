require 'tictactoe/board'

describe Board do
  let(:board) { Board.new }

  describe '#mark_position' do
    it 'marks a position on grid with an X' do
      board.mark_position(1, 'X')
      expect(board.grid).to eq ['X', 2, 3, 4, 5, 6, 7, 8, 9]
    end

    it 'raises an error if the position is taken' do
      board = Board.new(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      expect{ board.mark_position(1, 'O') }.to raise_error
    end
  end

  describe '#winner' do
    [['X', 'X', 'X', 4, 5, 6, 7, 8, 9],
     ['X', 'X', 'X', 4, 5, 6, 7, 8, 9],
     ['X', 'X', 'X', 4, 5, 6, 7, 8, 9],
     ['X', 2, 3, 'X', 5, 6, 'X', 8, 9],
     [1, 'X', 3, 4, 'X', 6, 7, 'X', 9],
     [1, 2, 'X', 4, 5, 'X', 7, 8, 'X'],
     ['X', 2, 3, 4, 'X', 6, 7, 8, 'X'],
     [1, 2, 'X', 4, 'X', 6, 'X', 8, 9]].each do |combo|
       it "returns true if there's a win" do
        board = Board.new(combo)
        expect(board.winner?).to eq true
       end
     end

     it "returns false if there's no win" do
       expect(board.winner?).to eq false
     end
  end

  describe '#available_moves' do
    it 'returns the available moves from the board' do
      board = Board.new(['X', 'O', 3, 'X', 5, 6, 7, 'X', 9])
      expect(board.available_moves).to eq [3, 5, 6, 7, 9]
      another_board = Board.new([1, 2, 3, 'X', 5, 6, 7, 8, 9])
      expect(another_board.available_moves).to eq [1, 2, 3, 5, 6, 7, 8, 9]
    end
  end

  describe '#current_mark' do
    it 'returns X if no move was made on the board' do
      expect(board.current_mark).to eq 'X'
    end

    it 'returns O if a move was made on the board' do
      board = Board.new([1, 'X', 3, 4, 5, 6, 7, 8, 9])
      expect(board.current_mark).to eq 'O'
    end
  end

  describe '#game_over?' do
    it 'returns true if the board has a winner' do
      board = Board.new(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      expect(board.game_over?).to eq true
    end

    it 'returns true if the board has no available moves' do
      board = Board.new(['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O'])
      expect(board.game_over?).to eq true
    end
  end
end
