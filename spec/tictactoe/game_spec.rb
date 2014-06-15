require 'tictactoe/game'
require 'tictactoe/board'
require 'cli_display'

describe Game do
  let(:board)   { Board.new }
  let(:output)  { StringIO.new }
  let(:input)   { StringIO.new("1\nx\n") }
  let(:display) { CliDisplay.new(output, input) }
  let(:game)    { Game.new(display, board) }

  it 'receives input from the user' do
    expect(game.receive_user_input).to eq 1
  end

  it 'alters the board based on user input' do
    game.mark_board_position
    expect(board.grid).to eq ['X', 2, 3, 4, 5, 6, 7, 8, 9]
  end

  it 'does not alter the board if the input is invalid' do
    expect(game.move_valid?).to eq true
    expect(game.move_valid?).to eq false
  end
end
