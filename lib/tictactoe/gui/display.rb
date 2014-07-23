require 'qt'
require 'tictactoe/gui/cell'
require 'tictactoe/game'

module TicTacToe
  module GUI
    class Display < Qt::Widget
      attr_reader :cells, :game, :main_layout, :buttons, :grid,
                  :hvh_button, :hvc_button, :cvh_button, :cvc_button

      BUTTONS = { :hvh => :human_vs_human,
                  :hvc => :human_vs_computer,
                  :cvh => :computer_vs_human,
                  :cvc => :computer_vs_computer
      }

      slots BUTTONS[:hvh], BUTTONS[:hvc], BUTTONS[:cvh], BUTTONS[:cvc]

      def initialize
        super
        @game = Game.new
        @cells = []
        self.objectName = 'display'
        self.resize(500, 700)
        main_layout_setup
        connect(hvh_button, SIGNAL(:pressed), self, SLOT(BUTTONS[:hvh]))
        connect(hvc_button, SIGNAL(:pressed), self, SLOT(BUTTONS[:hvc]))
        connect(cvh_button, SIGNAL(:pressed), self, SLOT(BUTTONS[:cvh]))
        connect(cvc_button, SIGNAL(:pressed), self, SLOT(BUTTONS[:cvc]))
      end

      def play
        case @game_choice
        when BUTTONS[:hvh]
          update_grid
        when BUTTONS[:hvc]
          update_grid
          game.computer_makes_move if !game.is_over?
          update_grid
        when BUTTONS[:cvh]
          game.computer_makes_move
          update_grid
        when BUTTONS[:cvc]
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
        %w{hvh_button hvc_button cvh_button cvc_button}.each do |button|
          create_button(button)
        end
        { hvh_button => 'Human Vs Human',
          hvc_button => 'Human Vs Computer',
          cvh_button => 'Computer Vs Human',
          cvc_button => 'Computer Vs Computer'
        }.each do |button, description|
          button.text = description
          buttons.add_widget(button)
        end
        buttons.set_alignment(Qt::AlignHCenter | Qt::AlignTop)
        buttons
      end

      def create_button(button)
        instance_variable_set "@#{button}", Qt::RadioButton.new(self)
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
        button_clicked(:hvh)
      end

      def human_vs_computer
        button_clicked(:hvc)
      end

      def computer_vs_human
        button_clicked(:cvh)
      end

      def computer_vs_computer
        button_clicked(:cvc)
      end

      def button_clicked(btn)
        @game_choice = BUTTONS[btn]
        remove_buttons
        play if btn == :cvh || btn == :cvc
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
