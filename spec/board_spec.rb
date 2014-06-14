require 'board'

describe Board do
  let(:board) { Board.new }

  it 'has a default grid' do
    expect(board.grid).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

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
end
