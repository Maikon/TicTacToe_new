require 'tictactoe/gui/gui_display'
require 'tictactoe/gui/cell'
require 'qt'

describe TicTacToe::GUI::GuiDisplay do
  let(:window) { TicTacToe::GUI::GuiDisplay.new }

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
    text = 'Which game would you like to play?'
    window.ask_for_game_type
    expect(find_label_with_text(window, text)).to eq true
  end

  it 'gives the user two options' do
    expect(window.find_children(Qt::RadioButton).length).to eq 2
    child_1 = window.find_children(Qt::RadioButton)[0]
    expect(child_1.text).to eq 'Human vs Human'
    child_2 = window.find_children(Qt::RadioButton)[1]
    expect(child_2.text).to eq 'Human vs Computer'
  end

  it 'removes the buttons' do
    window.remove_buttons
    expect(window.find_children(Qt::RadioButton).length).to eq 0
  end

  it 'marks a position on the board when clicked' do
    window.add_grid
    cell = find_label_with_name(window, '1')
    expect(find_label_with_text(window, 'X')).to eq false
    cell.mousePressEvent(nil)
    expect(find_label_with_text(window, 'X')).to eq true
  end

  it 'changes the label depending on the turn' do
    expect(find_label_with_text(window, "Welcome to Tic Tac Toe!")).to eq true
    window.greeting_label_text('X')
    expect(find_label_with_text(window, "Welcome to Tic Tac Toe!")).to eq false
    expect(find_label_with_text(window, "X")).to eq true
  end

  def find_label_with_text(window, text)
    window.find_children(Qt::Label).any? do |child|
      child.text == text
    end
  end

  def find_label_with_name(window, text)
    window.find_children(Qt::Label).find do |child|
      child.objectName == text
    end
  end
end
