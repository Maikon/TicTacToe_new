module TicTacToe
  class CliGame
    attr_reader :display, :game

    def initialize(display, game)
      @display = display
      @game = game
    end

    def start
      display.greet_players
    end

    def print_board
      display.show_board(game.board_grid)
    end

    def validate_move
      move = display.ask_for_move(game.current_mark)
      until game.valid_move?(move)
        display.invalid_move_message
        move = display.ask_for_move(game.current_mark)
      end
      move
    end
  end
end
