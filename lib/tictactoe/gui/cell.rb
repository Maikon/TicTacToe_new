require 'qt'

module TicTacToe
  module GUI
    class Cell < Qt::Label
      attr_reader :game

      def initialize(parent, game)
        super(nil)
        self.alignment = Qt::AlignHCenter
        self.frame_style = Qt::Frame::WinPanel
        @parent = parent
        @game = game
      end

      def mousePressEvent(_)
        return if @game.is_over?
        @parent.play(self.objectName.to_i)
      end
    end
  end
end
