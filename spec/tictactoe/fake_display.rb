module TicTacToe

  class FakeDisplay
    attr_reader :output

    def initialize(moves)
      @moves = moves
      @output = ""
    end

    def ask_for_game_type
      @moves.shift
    end

    def greet_players
      @output << "Welcome to Tic Tac Toe!\n"
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

    def computer_goes_first?(choice)
      choice == '2'
    end

    def clear_screen
    end
  end
end
