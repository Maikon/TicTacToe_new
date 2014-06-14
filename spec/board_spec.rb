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

  describe '#winner' do
    [['X', 'X', 'X', 4, 5, 6, 7, 8, 9],
     ['X', 'X', 'X', 4, 5, 6, 7, 8, 9],
     ['X', 'X', 'X', 4, 5, 6, 7, 8, 9]].each do |row|
       it "returns true if there's a winner in the first row" do
        board = Board.new(row)
        expect(board.winner?).to eq true
       end
     end

    [['X', 2, 3, 'X', 5, 6, 'X', 8, 9],
     [1, 'X', 3, 4, 'X', 6, 7, 'X', 9],
     [1, 2, 'X', 4, 5, 'X', 7, 8, 'X']].each do |column|
       it "returns true if there's a winner in a column" do
         board = Board.new(column)
         expect(board.winner?).to eq true
       end
     end

     [['X', 2, 3, 4, 'X', 6, 7, 8, 'X'],
      [1, 2, 'X', 4, 'X', 6, 'X', 8, 9]].each do |diagonal|
       it "returns true if there's a winner in a diagonal" do
         board = Board.new(diagonal)
         expect(board.winner?).to eq true
       end
     end
  end
end
