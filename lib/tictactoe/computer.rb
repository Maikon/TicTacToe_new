class Computer
  attr_reader :mark

  def choose_mark(board)
    board.available_moves.length.odd? ? @mark = 'X' : @mark = 'O'
  end
end
