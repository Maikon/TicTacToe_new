require 'spec_helper'
require 'tictactoe/gui/display'

describe TicTacToe::GUI::Display do
  before(:all) do
    app = Qt::Application.new(ARGV)
  end

  it 'has a grid with nine cells' do
    display = TicTacToe::GUI::Display.new
    display.grid.each do |cell|
      expect(cell).to be_instance_of(TicTacToe::GUI::Cell)
    end
  end
end
