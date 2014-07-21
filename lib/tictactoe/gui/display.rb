require 'qt'
require 'tictactoe/gui/cell'
require 'tictactoe/game'

module TicTacToe
  module GUI
    class Display < Qt::Widget
      attr_reader :cells, :game, :main_layout, :buttons,
                  :grid, :hvh_game, :hvc_game

      slots :remove_buttons

      def initialize
        super
        @game = Game.new
        @cells = []
        self.objectName = 'display'
        self.resize(500, 700)
        main_layout_setup
        connect(hvh_game, SIGNAL(:pressed), self, SLOT(:remove_buttons))
      end

      def play(position)
        if game.valid_move?(position)
          game.play_next_move(position)
          update_grid
        end
      end

      private

      def main_layout_setup
        @main_layout = Qt::VBoxLayout.new(self)
        label = Qt::Label.new
        label.text = "Welcome to Tic Tac Toe!"
        label.set_alignment(Qt::AlignHCenter | Qt::AlignTop)
        main_layout.add_widget(label)
        main_layout.add_layout(game_options_layout)
        main_layout.add_layout(grid_layout)
      end

      def game_options_layout
        @buttons = Qt::HBoxLayout.new
        @hvh_game = Qt::RadioButton.new(self)
        hvh_game.text = 'Human Vs Human'
        @hvc_game = Qt::RadioButton.new(self)
        hvc_game.text = 'Human Vs Computer'
        buttons.add_widget(hvh_game)
        buttons.add_widget(hvc_game)
        buttons.set_alignment(Qt::AlignHCenter | Qt::AlignTop)
        buttons
      end

      def grid_layout
        @grid = Qt::GridLayout.new
        grid.set_horizontal_spacing(0)
        grid.set_vertical_spacing(0)
        0.upto(8) do |num|
          row, col = num.divmod(3)
          cell = Cell.new(self, game)
          cell.objectName = num + 1
          cells << cell
          grid.add_widget(cell, row, col)
        end
        grid
      end

      def update_grid
        game.board_grid.each.with_index do |cell, index|
          cells[index].text = cell if cell.is_a?(String)
        end
      end

      def remove_buttons
        hvh_game.dispose
        hvc_game.dispose
      end
    end
  end
end
