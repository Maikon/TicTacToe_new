class Game
  attr_reader :display, :board

  def initialize(display, board)
    @display = display
    @board = board
  end

  def receive_user_input
    display.ask_for_move
  end
end
