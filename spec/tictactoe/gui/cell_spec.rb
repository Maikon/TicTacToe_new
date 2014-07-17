require 'spec_helper'
require 'tictactoe/gui/cell'

describe TicTacToe::GUI::Cell do
  let(:parent) { Qt::Widget.new }
  let(:game)   { TicTacToe::Game.new }
  let(:cell)   { TicTacToe::GUI::Cell.new(parent, game) }

  before(:all) do
    app = Qt::Application.new(ARGV)
  end

  it 'is an instance of Qt Label' do
    expect(cell).to be_kind_of(Qt::Label)
  end

  it 'takes has a parent and a game upon initialisation' do
    expect(cell.game).to eq game
    expect(cell.parent).to be_kind_of(Qt::Widget)
  end

  it 'upon click it returns the cell name' do
    cell.objectName = 1
    expect(cell.mousePressEvent(nil)).to eq 1
  end
end
