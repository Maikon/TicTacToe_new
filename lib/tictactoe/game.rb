module TicTacToe
 class Game
   attr_reader :board, :computer

   def initialize(board = Board.new, computer = Computer.new)
     @board = board
     @computer = computer
   end

   def winner?
     board.winner?
   end

   def draw?
     board.draw?
   end

   def over?
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
 end
end
