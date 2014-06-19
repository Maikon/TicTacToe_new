class Game
  attr_reader :display, :board

  def initialize(display = CliDisplay.new, board = Board.new)
    @display = display
    @board = board
  end

  def receive_user_input
    display.show_board(board.grid)
    display.ask_for_move(board.current_mark)
  end

  def mark_board_position
    board.mark_position(receive_user_input, board.current_mark)
  end

  def move_valid?(move)
    board.available_moves.include?(move)
  end

  def move_sequence
    move = receive_user_input
    while !move_valid?(move)
      display.invalid_move_message
      move = receive_user_input
    end
    board.mark_position(move, board.current_mark)
  end

  def start
    display.greet_players
    until board.game_over?
      move_sequence
    end
    display.print_winning_message_for(board.last_move_mark) if board.winner?
    display.print_draw_message if board.available_moves.empty?
    display.play_again?
  end
end
