require 'gui_display'
require 'qt'

describe GuiDisplay do
  let(:window) { GuiDisplay.new }

  before(:all) do
    app = Qt::Application.new(ARGV)
  end

  it 'is an instance of Qt::Widget' do
    expect(window).to be_kind_of(Qt::Widget)
  end

  it 'greets the players' do
    text = "Welcome to Tic Tac Toe!"
    window.greet_players
    expect(find_label_with_text(window, text)).to eq true
  end

  it 'asks user for game type selection' do
    expect(window.find_children(Qt::PushButton).length).to eq 2
    child_1 = window.find_children(Qt::PushButton)[0]
    expect(child_1.text).to eq 'Human Vs Human'
    child_2 = window.find_children(Qt::PushButton)[1]
    expect(child_2.text).to eq 'Human Vs Computer'
  end

  def find_label_with_text(window, text)
    window.find_children(Qt::Label).any? do |child|
      child.text == text
    end
  end
end
