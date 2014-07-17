require 'qt'

module TicTacToe
  module GUI
    class Cell < Qt::Label
      attr_reader :game

      def initialize(parent, game)
        super(nil)
        @parent = parent
        @game = game
      end

      def mousePressEvent(_)
        return if @game.is_over?
        @parent.play
      end
    end
  end
end
