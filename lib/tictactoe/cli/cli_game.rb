module TicTacToe
  class CliGame
    attr_reader :display

    def initialize(display)
      @display = display
    end

    def start
      display.greet_players
    end
  end
end
