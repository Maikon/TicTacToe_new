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
        @grid = Array.new(9) { Cell.new(self, game) }
        self.resize(500, 700)
        greeting_label
        game_options
      end

      def greeting_label
        @layout = Qt::VBoxLayout.new(self)
        label = Qt::Label.new
        label.text = "Welcome to Tic Tac Toe!"
        @layout.add_widget(label)
      end

      def game_options
        @buttons_layout = Qt::HBoxLayout.new
        @hvh_game = Qt::RadioButton.new(self)
        @hvc_game = Qt::RadioButton.new(self)
        @buttons_layout.add_widget(@hvh_game)
        @buttons_layout.add_widget(@hvc_game)
        @buttons_layout.set_alignment(Qt::AlignHCenter | Qt::AlignTop)
        @layout.add_layout(@buttons_layout)
      end

      def play(object)
        object.setText(game.current_mark)
        position = grid.index(object) + 1
        game.play_next_move(position)
      end
    end
  end
end
