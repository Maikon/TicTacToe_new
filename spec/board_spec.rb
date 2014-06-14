require 'board'

describe Board do
  it 'has a default grid' do
    expect(Board.new.grid).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  describe '#mark_position' do
    it 'marks a position on grid with an X' do
      board = Board.new
      board.mark_position(1, 'X')
      expect(board.grid).to eq ['X', 2, 3, 4, 5, 6, 7, 8, 9]
    end

    it 'raises an error if the position is taken' do
      board = Board.new
      board.mark_position(1, 'X')
      expect{ board.mark_position(1, 'O') }.to raise_error
    end
  end
end
