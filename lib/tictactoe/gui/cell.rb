require 'qt'

module TicTacToe
  module GUI
    class Cell < Qt::Label

      attr_reader :game

      FONT = Qt::Font.new("Helvetica Neue", 80, 0)

      def initialize(parent, game)
        super(parent)
        @game = game
        self.alignment = Qt::AlignHCenter
        self.frame_style = Qt::Frame::WinPanel
        self.setFont(FONT)
      end

      def mousePressEvent(_)
        return if game.is_over?
        self.text = game.current_mark
        position = self.objectName.to_i + 1
        self.parent.greeting_label_text("It's #{game.last_move_mark}'s turn")
        game.play_next_move(position)
      end
    end
  end
end
