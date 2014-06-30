class Game
  attr_reader :display, :board, :computer

  def initialize(display = CliDisplay.new, board = Board.new, computer = TicTacToe::Computer.new)
    @display = display
    @board = board
    @computer = computer
  end

  def start
    display.greet_players
    @choice = select_game
    until board.game_over?
      move_sequence
    end
    game_over_sequence
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
    computer_makes_move if display.computer_goes_first?(@choice)
  end

  def computer_makes_move
    computer.choose_mark(board)
    computer.make_move(board) unless board.game_over?
    move_sequence unless board.game_over?
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
