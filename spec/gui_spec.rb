require 'gui_display'
require 'qt'

describe GuiDisplay do
  it 'is an instance of Qt::Widget' do
    app = Qt::Application.new(ARGV)
    window = GuiDisplay.new
    expect(window).to be_kind_of(Qt::Widget)
  end

  it 'greets the players' do
    app = Qt::Application.new(ARGV)
    window = GuiDisplay.new
    text = "Welcome to Tic Tac Toe!"
    window.greet_players
    expect(find_child_with_text(window, text)).to eq true
  end

  def find_child_with_text(window, text)
    window.find_children(Qt::Label).any? do |child|
      child.text == text
    end
  end
end
