require 'qt'
require 'tictactoe/gui/cell'
require 'tictactoe/game'

module TicTacToe
  module GUI
    class Display < Qt::Widget
      attr_reader :cells, :game, :main_layout, :buttons, :grid,
                  :hvh_button, :hvc_button, :cvh_button, :cvc_button

      slots :human_vs_human, :human_vs_computer, :computer_vs_human, :computer_vs_computer

      def initialize
        super
        @game = Game.new
        @cells = []
        self.objectName = 'display'
        self.resize(500, 700)
        main_layout_setup
        connect(hvh_button, SIGNAL(:pressed), self, SLOT(:human_vs_human))
        connect(hvc_button, SIGNAL(:pressed), self, SLOT(:human_vs_computer))
        connect(cvh_button, SIGNAL(:pressed), self, SLOT(:computer_vs_human))
        connect(cvc_button, SIGNAL(:pressed), self, SLOT(:computer_vs_computer))
      end

      def play
        case @game_choice
        when :hvh
          update_grid
        when :hvc
          update_grid
          game.computer_makes_move
          update_grid
        when :cvh
          game.computer_makes_move
          update_grid
        when :cvc
          until game.is_over?
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
      end

      def game_options_layout
        @buttons = Qt::HBoxLayout.new
        @hvh_button = Qt::RadioButton.new(self)
        @hvc_button = Qt::RadioButton.new(self)
        @cvh_button = Qt::RadioButton.new(self)
        @cvc_button = Qt::RadioButton.new(self)
        hvh_button.text = 'Human Vs Human'
        hvc_button.text = 'Human Vs Computer'
        cvh_button.text = 'Computer Vs Human'
        cvc_button.text = 'Computer Vs Computer'
        buttons.add_widget(hvh_button)
        buttons.add_widget(hvc_button)
        buttons.add_widget(cvh_button)
        buttons.add_widget(cvc_button)
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
        @game_choice = :hvh
        remove_buttons
      end

      def human_vs_computer
        @game_choice = :hvc
        remove_buttons
      end

      def computer_vs_human
        @game_choice = :cvh
        remove_buttons
        play
      end

      def computer_vs_computer
        @game_choice = :cvc
        remove_buttons
        play
      end

      def remove_buttons
        [hvh_button, hvc_button, cvh_button, cvc_button].each do |button|
          button.dispose
        end
        main_layout.add_layout(grid_layout)
      end
    end
  end
end
