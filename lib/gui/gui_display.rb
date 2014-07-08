require 'qt'

class GuiDisplay < Qt::Widget

  slots :remove_button_one, :remove_button_two

  def initialize
    super
    self.windowTitle = 'Tic Tac Toe'
    layout_setup
    add_button_one
    add_button_two
    connect(@button_one, SIGNAL(:pressed), self, SLOT(:remove_button_one))
    connect(@button_one, SIGNAL(:pressed), self, SLOT(:remove_button_two))
    connect(@button_two, SIGNAL(:pressed), self, SLOT(:remove_button_one))
    connect(@button_two, SIGNAL(:pressed), self, SLOT(:remove_button_two))
  end

  def greet_players
    label = Qt::Label.new(self)
    label.alignment = Qt::AlignHCenter
    label.text = "Welcome to Tic Tac Toe!"
    label
  end

  def ask_for_game_type
    @label = Qt::Label.new(self)
    @label.alignment = Qt::AlignHCenter
    @label.text = "Which game would you like to play?"
    @label
  end

  private

  def layout_setup
    @layout = Qt::VBoxLayout.new(self)
    @buttons_layout = Qt::HBoxLayout.new
    @layout.add_widget(greet_players)
    @layout.add_widget(ask_for_game_type)
    @layout.add_layout(@buttons_layout)
  end

  def add_button_one
    @button_one = Qt::RadioButton.new("Human vs Human", self)
    @buttons_layout.add_widget(@button_one)
  end

  def add_button_two
    @button_two = Qt::RadioButton.new("Human vs Computer", self)
    @buttons_layout.add_widget(@button_two)
  end

  def remove_button_one
    @button_one.hide
    @label.hide
    show_selection
  end

  def remove_button_two
    @button_two.hide
    @label.hide
    show_selection
  end
end
