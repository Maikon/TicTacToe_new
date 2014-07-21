require 'qt'
require 'tictactoe/gui/cell'
require 'tictactoe/game'

module TicTacToe
  module GUI
    class Display < Qt::Widget
      attr_reader :cells, :game, :main_layout, :buttons,
                  :grid, :hvh_button, :hvc_button

      slots :human_vs_human, :human_vs_computer

      def initialize
        super
        @game = Game.new
        @cells = []
        self.objectName = 'display'
        self.resize(500, 700)
        main_layout_setup
        connect(hvh_button, SIGNAL(:pressed), self, SLOT(:human_vs_human))
        connect(hvc_button, SIGNAL(:pressed), self, SLOT(:human_vs_computer))
      end

      def play(position)
        if game.valid_move?(position)
          case @game_type
          when :hvh
            game.play_next_move(position)
            update_grid
          when :hvc
            game.play_next_move(position)
            update_grid
            game.computer_makes_move
            update_grid
          end
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
        @hvh_button = Qt::RadioButton.new(self)
        hvh_button.text = 'Human Vs Human'
        @hvc_button = Qt::RadioButton.new(self)
        hvc_button.text = 'Human Vs Computer'
        buttons.add_widget(hvh_button)
        buttons.add_widget(hvc_button)
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

      def human_vs_human
        @game_type = :hvh
        hvh_button.dispose
        hvc_button.dispose
      end

      def human_vs_computer
        @game_type = :hvc
      end
    end
  end
end
