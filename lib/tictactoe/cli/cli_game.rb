module TicTacToe
  class CliGame
    attr_reader :game, :display

    def initialize(game, display)
      @game = game
      @display = display
    end

    def start
      display.greet_players
      until game.over?
        make_move
      end
      print_winning_message?
      print_draw_message?
      play_another_around?
    end

    def make_move
      game.play_next_move(validate_move(receive_user_input))
    end

    def receive_user_input
      display.show_board(game.board_grid)
      display.ask_for_move(game.current_mark)
    end

    def print_winning_message?
      display.print_winning_message_for(game.last_move_mark) if game.winner?
    end

    def print_draw_message?
      display.print_draw_message if game.draw?
    end

    def play_another_around?
      display.another_round? ? restart_game : display.print_farewell_message
    end

    def restart_game
      display.clear_screen
      game.reset
      start
    end

    private

    def validate_move(move)
      until game.valid_move?(move)
        display.invalid_move_message
        move = receive_user_input
      end
      move
    end
  end
end
