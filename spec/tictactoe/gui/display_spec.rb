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

  it 'has four radio buttons' do
    expect(display.find_children(Qt::RadioButton).length).to eq 4
  end

  it 'marks the appropriated cell when clicked' do
    display.hvh_button.click
    display.cells.first.mousePressEvent(nil)
    expect(display.cells[0].text).to eq 'X'
    display.cells[1].mousePressEvent(nil)
    expect(display.cells[1].text).to eq 'O'
  end

  it 'does not mark a cell if a cell is marked already' do
    display.hvh_button.click
    display.cells.first.mousePressEvent(nil)
    expect(display.cells[0].text).to eq 'X'
    display.cells[0].mousePressEvent(nil)
    expect{ display.cells[0].text }.not_to raise_error
    expect(display.cells[0].text).to eq 'X'
  end

  it 'removes the buttons when one is chosen' do
    expect(display.find_children(Qt::RadioButton).length).to eq 4
    display.hvh_button.click
    expect(display.find_children(Qt::RadioButton).length).to eq 0
  end

  it 'plays a human vs computer' do
    display.hvc_button.click
    expect(display.cells[4].text).to eq nil
    display.cells[0].mousePressEvent(nil)
    expect(display.cells[4].text).to eq 'O'
  end

  it 'plays a computer vs human' do
    display.cvh_button.click
    expect(display.cells[0].text).to eq 'X'
  end

  it 'plays a computer vs computer' do
    display.cvc_button.click
    expect(display.game.is_draw?).to eq true
  end
end
