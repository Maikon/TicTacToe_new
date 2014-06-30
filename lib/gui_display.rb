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

  private

  def layout_setup
    layout = Qt::VBoxLayout.new(self)
    @buttons_layout = Qt::HBoxLayout.new
    layout.add_widget(greet_players)
    layout.add_layout(@buttons_layout)
  end

  def add_button_one
    choice_1 = Qt::PushButton.new(self)
    choice_1.text = 'Human Vs Human'
    @buttons_layout.add_widget(choice_1)
  end

  def add_button_two
    choice_2 = Qt::PushButton.new(self)
    choice_2.text = 'Human Vs Computer'
    @buttons_layout.add_widget(choice_2)
  end
end
