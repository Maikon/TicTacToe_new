class Game
  attr_reader :display, :board

  def initialize(display = CliDisplay.new, board = Board.new)
    @display = display
    @board = board
  end

  def receive_user_input
    display.ask_for_move
  end

  def mark_board_position
    board.mark_position(receive_user_input, board.current_mark)
  end

  def move_valid?
    board.available_moves.include?(receive_user_input)
  end
end
