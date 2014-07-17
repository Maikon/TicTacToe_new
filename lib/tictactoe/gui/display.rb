require 'qt'
require 'tictactoe/gui/cell'

module TicTacToe
  module GUI
    class Display < Qt::Widget
      attr_reader :grid

      def initialize
        super
        build_grid
      end

      def build_grid
        @grid = Array.new(9) { Cell.new(self, nil) }
      end
    end
  end
end
