module TicTacToe

  class FakeDisplay

    def initialize(moves)
      @moves = moves
    end

    def print_board(grid)
    end

    def ask_for_move(mark)
      @moves.shift
    end

    def invalid_move_message
    end
  end
end
