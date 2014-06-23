class Computer
  attr_reader :mark

  def choose_mark(board)
    board.available_moves.length.odd? ? @mark = 'X' : @mark = 'O'
  end

  def minimax(board, depth = 0, score = {})
    return 10 if board.win_for(mark)
    return -10 if board.win_for(opponent)
    return 1 if board.draw?

    board.available_moves.each do |move|
      board.mark_position(move, board.current_mark)
      score[move] = minimax(board, depth += 1, {})
      board.reset_value(move)
    end

    if depth == board.available_moves.length
      move = score.max_by { |move, score| score }[0]
      return move
    end

    if board.current_mark == mark
      maximum_score = score.max_by { |move, score| score }[1]
      return maximum_score
    else
      minimum_score = score.min_by { |move, score| score }[1]
      return minimum_score
    end
  end

  private

  def opponent
    @mark == 'X' ? 'O' : 'X'
  end
end
