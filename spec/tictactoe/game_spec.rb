require 'tictactoe/game'
require 'tictactoe/board'
require 'cli_display'

describe Game do
  it 'receives input from the user' do
    board = Board.new
    output = StringIO.new
    input = StringIO.new("1\n2\n")
    display = CliDisplay.new(output, input)
    game = Game.new(display, board)
    expect(game.receive_user_input).to eq 1
    expect(game.receive_user_input).to eq 2
  end

  it 'alters the board based on user input' do
    board = Board.new
    output = StringIO.new
    input = StringIO.new("1\n")
    display = CliDisplay.new(output, input)
    game = Game.new(display, board)
    game.mark_board_position
    expect(board.grid).to eq ['X', 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
