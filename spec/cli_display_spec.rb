require 'cli_display'
require 'tictactoe/board'
require 'tictactoe/fake_board'
require 'spec_helper'

describe CliDisplay do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new("1\ny\n") }
  let(:display) { CliDisplay.new(output, input) }

  describe '#greet_players' do
    it 'greets the players' do
      display.greet_players
      expect(output.string).to eq "***************\nWelcome to Tic Tac Toe!\n***************\n"
    end
  end

  describe '#print_board' do
    it 'prints the board' do
      display.show_board(Board.new.grid)
      expect(output.string).to eq "1 | 2 | 3\n--|---|--\n4 | 5 | 6\n--|---|--\n7 | 8 | 9\n"
    end
  end

  describe '#ask_for_move' do
    it 'asks the player for a move and returns the input' do
      expect(display.ask_for_move('X')).to eq 1
      expect(output.string).to eq "It's X's turn to choose a move from the available ones:\n"
    end
  end

  describe '#another_round' do
    it 'asks the player for another round and returns the input' do
      input.gets
      expect(display.another_round?).to eq 'y'
      expect(output.string).to eq "Would you like to play again? Press 'y' if so or any other key to quit:\n"
    end
  end

  describe '#farewell_message' do
    it 'prints a farewell message when the game is over' do
      display.print_farewell_message
      expect(output.string).to eq "Thanks for playing!\n"
    end
  end

  describe '#current_mark' do
    it 'prints the current mark' do
      display.current_mark('X')
      expect(output.string).to eq "It's X's turn now\n"
    end
  end

  describe '#invalid_move_message' do
    it 'prints an invalid move message' do
      display.invalid_move_message
      expect(output.string).to eq "Please choose a valid move from the board:\n"
    end
  end

  describe '#print_winning_message_for' do
    it 'prints a winning message' do
      display.print_winning_message_for('X')
      expect(output.string).to eq "X won the game!\n"
    end
  end

  describe '#print_draw_message' do
    it 'prints a draw message' do
      display.print_draw_message
      expect(output.string).to eq "The game is a draw\n"
    end
  end

  describe '#play_again?' do
    it 'resets the board if answer is yes' do
      input = StringIO.new("y\n")
      output = StringIO.new
      display = CliDisplay.new(output, input)
      fake_board = TicTacToe::FakeBoard.new(['X', 'O', 'X', 'O', 5, 6, 7, 8, 9])
      display.play_again?(fake_board)
      expect(fake_board.grid).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    it 'otherwise prints a farewell message' do
      input = StringIO.new("n\n")
      output = StringIO.new
      display = CliDisplay.new(output, input)
      display.play_again?(false)
      output.rewind
      expect(output.readlines[1]).to eq "Thanks for playing!\n"
    end
  end
end
