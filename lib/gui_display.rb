require 'qt'

class GuiDisplay < Qt::Widget

  def initialize
    super
    self.windowTitle = 'Tic Tac Toe'
    layout_setup
    add_button_one
    add_button_two
  end

  def greet_players
    label = Qt::Label.new(self)
    label.alignment = Qt::AlignHCenter
    label.text = "Welcome to Tic Tac Toe!"
    label
  end

  def ask_for_game_type
    label = Qt::Label.new(self)
    label.alignment = Qt::AlignHCenter
    label.text = "Which game would you like to play?"
    label
  end

  private

  def layout_setup
    layout = Qt::VBoxLayout.new(self)
    @buttons_layout = Qt::HBoxLayout.new
    layout.add_widget(greet_players)
    layout.add_widget(ask_for_game_type)
    layout.add_layout(@buttons_layout)
  end

  def add_button_one
    button = Qt::PushButton.new(self)
    button.text = 'Human Vs Human'
    @buttons_layout.add_widget(button)
  end

  def add_button_two
    button = Qt::PushButton.new(self)
    button.text = 'Human Vs Computer'
    @buttons_layout.add_widget(button)
  end
end
