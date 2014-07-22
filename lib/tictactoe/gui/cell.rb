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
        position = self.objectName.to_i
        if game.valid_move?(position)
          game.play_next_move(position)
          @parent.play
        end
      end
    end
  end
end
