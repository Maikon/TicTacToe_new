require 'qt'

module TicTacToe
  module GUI
    class Cell < Qt::Label
      attr_reader :game

      def initialize(parent, game)
        super(parent)
        @game = game
      end
    end
  end
end
