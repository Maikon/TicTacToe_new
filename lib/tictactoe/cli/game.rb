module TicTacToe
  module CLI
    class Game
      attr_reader :display, :game

      def initialize(display, game)
        @display = display
        @game = game
      end

      def start
        display.greet_players
        while !game.is_over?
          print_board
          mark_position_with(valid_move)
          print_results
          if game.is_over? && display.another_round?
            display.clear_screen
            reset_game_board
          end
        end
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
        if game.has_winner?
          display.print_winning_message_for(game.last_move_mark)
        elsif game.is_draw?
          display.print_draw_message
        end
      end

      def mark_position_with(move)
        game.play_next_move(move)
      end

      def reset_game_board
        game.reset
      end
    end
  end
end
