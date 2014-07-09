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
        move_sequence
      end
    end

    def move_sequence
      move = receive_user_input
      until game.valid_move?(move)
        display.invalid_move_message
        move = receive_user_input
      end
      game.play_next_move(move)
    end

    def receive_user_input
      display.show_board(game.board_grid)
      display.ask_for_move(game.current_mark)
    end
  end
end
