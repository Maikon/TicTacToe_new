module TicTacToe
  module CLI
    class Display

      BOARD = <<-GRID
* | * | *
--|---|--
* | * | *
--|---|--
* | * | *
      GRID
      SPACING = '*' * 15

      def initialize(output = $stdout, input = $stdin)
        @output = output
        @input = input
      end

      def greet_players
        @output.puts SPACING
        @output.puts "Welcome to Tic Tac Toe!"
        @output.puts SPACING
      end

      def ask_for_game_type
        @output.puts "Please choose the number for the game you want to play: 1) Human vs Human 2) Human vs Computer"
        @input.gets.chomp
      end

      def ask_for_move(mark)
        @output.puts "It's #{mark}'s turn to choose a move from the available ones:"
        @input.gets.chomp.to_i
      end

      def print_farewell_message
        @output.puts 'Thanks for playing!'
      end

      def print_winning_message_for(mark)
        @output.puts "#{mark} won the game!"
      end

      def print_draw_message
        @output.puts 'The game is a draw'
      end

      def computer_goes_first?(choice)
        choice == '2'
      end

      def another_round?
        @output.puts "Would you like to play again? Press 'y' if so or any other key to quit:"
        answer_is_yes?
      end

      def clear_screen
        @output.puts "\e[H\e[2J"
      end

      def invalid_move_message
        @output.puts 'Please choose a valid move from the board:'
      end

      def current_mark(mark)
        @output.puts "It's #{mark}'s turn now"
      end

      def show_board(grid)
        board = BOARD.dup
        grid.each do |position|
          board.sub!('*', position.to_s)
        end
        @output.puts board
      end

      private

      def answer_is_yes?
        answer = @input.gets.chomp
        answer == 'y'
      end
    end
  end
end
