require 'qt'
require 'tictactoe/gui/cell'
require 'tictactoe/game'

module TicTacToe
  module GUI
    class GuiDisplay < Qt::Widget

      attr_reader :game, :layout, :buttons_layout, :grid,
        :question_label, :greeting_label, :button_one, :button_two

      slots :remove_buttons

      def initialize
        super
        @game = Game.new
        self.windowTitle = 'Tic Tac Toe'
        self.resize(500, 700)
        layout_setup
        add_buttons
        connect(button_one, SIGNAL(:pressed), self, SLOT(:remove_buttons))
        connect(button_two, SIGNAL(:pressed), self, SLOT(:remove_buttons))
      end

      def layout_setup
        @layout = Qt::VBoxLayout.new(self)
        @buttons_layout = Qt::HBoxLayout.new
        layout.add_widget(greet_players)
        layout.add_widget(ask_for_game_type)
        layout.add_layout(buttons_layout)
        buttons_layout.set_alignment(Qt::AlignHCenter | Qt::AlignTop)
        layout
      end

      def greet_players
        @greeting_label = Qt::Label.new(self)
        greeting_label.set_alignment(Qt::AlignHCenter | Qt::AlignTop)
        greeting_label.text = "Welcome to Tic Tac Toe!"
        greeting_label
      end

      def ask_for_game_type
        @question_label = Qt::Label.new(self)
        question_label.set_alignment(Qt::AlignHCenter | Qt::AlignTop)
        question_label.text = "Which game would you like to play?"
        question_label
      end

      def add_grid
        @grid = Qt::GridLayout.new
        grid.set_horizontal_spacing(0)
        grid.set_vertical_spacing(0)
        0.upto(8) do |i|
          cell = Cell.new(self, @game)
          cell.objectName = i
          row, col = i.divmod(3)
          grid.add_widget(cell, row, col)
        end
        grid
      end

      def add_buttons
        @button_one = Qt::RadioButton.new("Human vs Human", self)
        @button_two = Qt::RadioButton.new("Human vs Computer", self)
        buttons_layout.add_widget(button_one)
        buttons_layout.add_widget(button_two)
      end

      def remove_buttons
        button_one.dispose
        button_two.dispose
        question_label.hide
        layout.add_layout(add_grid)
      end

      def greeting_label_text(text)
        greeting_label.text = text
      end
    end
  end
end
