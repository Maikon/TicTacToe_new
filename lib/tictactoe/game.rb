module TicTacToe
 class Game
   attr_reader :board, :computer

   def initialize(board = Board.new, computer = Computer.new)
     @board = board
     @computer = computer
   end

   def has_winner?
     board.winner?
   end

   def is_draw?
     board.draw?
   end

   def is_over?
     board.game_over?
   end

   def play_next_move(input)
     board.mark_position(input, board.current_mark)
   end

   def computer_makes_move
     computer.choose_mark(board)
     computer.make_move(board)
   end

   def reset
     board.reset
   end

   def board_grid
     board.grid
   end

   def current_mark
     board.current_mark
   end

   def last_move_mark
     board.last_move_mark
   end

   def valid_move?(move)
     board.available_moves.include?(move)
   end
 end
end
