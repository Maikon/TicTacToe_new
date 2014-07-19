require 'spec_helper'
require 'tictactoe/gui/qt_helper'
require 'tictactoe/gui/display'

describe TicTacToe::GUI::Display do
  let(:display) { TicTacToe::GUI::Display.new }

  include_context :qt_helper

  it 'has a grid with nine cells' do
    display.grid.each do |cell|
      expect(cell).to be_instance_of(TicTacToe::GUI::Cell)
    end
  end

  it 'marks the appropriated cell when clicked' do
    display.grid[0].mousePressEvent(nil)
    expect(display.grid[0].text).to eq 'X'
    display.grid[1].mousePressEvent(nil)
    expect(display.grid[1].text).to eq 'O'
  end

  it 'has a greeting label' do
    result = display.find_children(Qt::Label).any? do |child|
      child.text == "Welcome to Tic Tac Toe!"
    end
    expect(result).to eq true
  end

  it 'has two radio buttons' do
    expect(display.find_children(Qt::RadioButton).length).to eq 2
  end
end
