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

  it 'should play a move when the game is not over' do
    game = TicTacToe::Game.new( TicTacToe::Board.new(['X', 2, 'X', 'O', 'O', 6, 7, 8, 9]))
    parent = double
    cell = TicTacToe::GUI::Cell.new(parent, game)
    expect(parent).to receive(:play)
    cell.mousePressEvent(nil)
  end

  it 'does not play when the game is over' do
    game = TicTacToe::Game.new( TicTacToe::Board.new(['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9]))
    parent = double
    cell = TicTacToe::GUI::Cell.new(parent, game)
    expect(parent).not_to receive(:play)
    cell.mousePressEvent(nil)
  end
end
