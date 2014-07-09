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
  end
end
