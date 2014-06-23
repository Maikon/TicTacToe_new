require 'tictactoe/computer'

describe Computer do
  describe '#choose_mark' do
    it 'chooses O if available_moves is even' do
      board = Board.new(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      computer = Computer.new
      computer.choose_mark(board)
      expect(computer.mark).to eq 'O'
    end

    it 'chooses X if available_moves is odd' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      computer = Computer.new
      computer.choose_mark(board)
      expect(computer.mark).to eq 'X'
    end
  end
end
