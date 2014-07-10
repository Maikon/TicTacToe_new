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

    def valid_move
      move = display.ask_for_move(game.current_mark)
      until game.valid_move?(move)
        display.invalid_move_message
        move = display.ask_for_move(game.current_mark)
      end
      move
    end

    def print_results
      game.has_winner? ? display.print_winning_message_for(game.last_move_mark) : display.print_draw_message
    end

    def mark_position_with(move)
      game.play_next_move(move)
    end
  end
end
