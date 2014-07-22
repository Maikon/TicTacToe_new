require 'spec_helper'
require 'tictactoe/gui/qt_helper'
require 'tictactoe/gui/cell'

describe TicTacToe::GUI::Cell do
  let(:parent) { Qt::Widget.new }
  let(:game)   { TicTacToe::Game.new }
  let(:cell)   { TicTacToe::GUI::Cell.new(parent, game) }

  include_context :qt_helper

  it 'is an instance of Qt Label' do
    expect(cell).to be_kind_of(Qt::Label)
  end

  it 'plays a move when the game is not over' do
    game = TicTacToe::Game.new
    parent = double
    cell = TicTacToe::GUI::Cell.new(parent, game)
    cell.objectName = '1'
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
