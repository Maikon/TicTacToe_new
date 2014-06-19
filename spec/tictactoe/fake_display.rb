module TicTacToe

  class FakeDisplay

    def initialize(moves)
      @moves = moves
    end

    def greet_players
    end

    def print_winning_message_for(mark)
    end

    def show_board(grid)
    end

    def ask_for_move(mark)
      @moves.shift
    end

    def invalid_move_message
    end

    def another_round?
    end

    def print_farewell_message
    end

    def print_draw_message
    end

    def play_again?
    end
  end
end
