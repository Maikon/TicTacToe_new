require 'spec_helper'
require 'tictactoe/gui/cell'

describe TicTacToe::GUI::Cell do
  before(:all) do
    app = Qt::Application.new(ARGV)
  end

  it 'is an instance of Qt Label' do
    cell = TicTacToe::GUI::Cell.new(nil, nil)
    expect(cell).to be_kind_of(Qt::Label)
  end

  it 'takes has a parent and a game upon initialisation' do
    parent = Qt::Widget.new
    game = TicTacToe::Game.new
    cell = TicTacToe::GUI::Cell.new(parent, game)
    expect(cell.game).to eq game
    expect(cell.parent).to be_kind_of(Qt::Widget)
  end
end
