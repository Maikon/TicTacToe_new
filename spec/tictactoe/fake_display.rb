module TicTacToe

  class FakeDisplay

    def initialize(moves)
      @moves = moves
    end

    def greet_players
    end

    def print_winning_message_for(mark)
    end

    def print_board(grid)
    end

    def ask_for_move(mark)
      @moves.shift
    end

    def invalid_move_message
    end

    def another_round?
    end

    def print_farewell_message
      "Thanks for playing!\n"
    end

    def print_draw_message
    end
  end
end
