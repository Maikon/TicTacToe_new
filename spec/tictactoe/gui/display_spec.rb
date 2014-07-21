require 'spec_helper'
require 'tictactoe/gui/qt_helper'
require 'tictactoe/gui/display'

describe TicTacToe::GUI::Display do
  let(:display) { TicTacToe::GUI::Display.new }

  include_context :qt_helper

  it 'has a greeting label' do
    result = display.find_children(Qt::Label).any? do |child|
      child.text == "Welcome to Tic Tac Toe!"
    end
    expect(result).to eq true
  end

  it 'has two radio buttons' do
    expect(display.find_children(Qt::RadioButton).length).to eq 2
  end

  it 'marks the appropriated cell when clicked' do
    display.cells.first.mousePressEvent(nil)
    expect(display.cells[0].text).to eq 'X'
    display.cells[1].mousePressEvent(nil)
    expect(display.cells[1].text).to eq 'O'
  end

  it 'does not mark a cell if a cell is marked already' do
    display.cells.first.mousePressEvent(nil)
    expect(display.cells[0].text).to eq 'X'
    display.cells[0].mousePressEvent(nil)
    expect{ display.cells[0].text }.not_to raise_error
    expect(display.cells[0].text).to eq 'X'
  end

  it 'removes the buttons when one is chosen' do
    expect(display.find_children(Qt::RadioButton).length).to eq 2
    display.hvh_game.click
    expect(display.find_children(Qt::RadioButton).length).to eq 0
  end
end
