class Game
  attr_reader :display, :board, :computer

  def initialize(display = CliDisplay.new, board = Board.new, computer = Computer.new)
    @display = display
    @board = board
    @computer = computer
  end

  def start
    display.greet_players
    until board.game_over?
      move_sequence
    end
    game_over_sequence
  end

  def play_chosen_game
    choice = select_game
    if choice == '1'
      human_makes_move
    end
  end

  def select_game
    @display.ask_for_game_type
  end

  def move_sequence
    move = receive_user_input
    while !move_valid?(move)
      display.invalid_move_message
      move = receive_user_input
    end
    board.mark_position(move, board.current_mark)
  end

  def human_makes_move
    move = receive_user_input
    while !move_valid?(move)
      display.invalid_move_message
      move = receive_user_input
    end
    board.mark_position(move, board.current_mark)
    computer_makes_move
  end

  def computer_makes_move
    computer.choose_mark(board)
    computer.make_move(board) unless board.game_over?
    human_makes_move unless board.game_over?
  end

  def move_valid?(move)
    board.available_moves.include?(move)
  end

  def receive_user_input
    display.show_board(board.grid)
    display.ask_for_move(board.current_mark)
  end

  def game_over_sequence
    display.print_winning_message_for(board.last_move_mark) if board.winner?
    display.print_draw_message if board.available_moves.empty?
    display.another_round? ? start_new_game : display.print_farewell_message
  end

  def start_new_game
    display.clear_screen
    Game.new.start
  end
end
