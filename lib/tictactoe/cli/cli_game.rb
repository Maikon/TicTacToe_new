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
    end

    def make_move
      game.play_next_move(validate_move(receive_user_input))
    end

    def receive_user_input
      display.show_board(game.board_grid)
      display.ask_for_move(game.current_mark)
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
