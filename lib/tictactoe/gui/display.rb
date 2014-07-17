require 'qt'
require 'tictactoe/gui/cell'
require 'tictactoe/game'

module TicTacToe
  module GUI
    class Display < Qt::Widget
      attr_reader :grid, :game

      def initialize
        super
        @game = Game.new
        build_grid
      end

      def build_grid
        @grid = Array.new(9) { Cell.new(self, game) }
      end

      def play(object)
        object.setText(game.current_mark)
        position = grid.index(object) + 1
        game.play_next_move(position)
      end
    end
  end
end
