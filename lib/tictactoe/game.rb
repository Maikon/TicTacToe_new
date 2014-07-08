module TicTacToe
 class Game
   attr_reader :board

   def initialize(board)
     @board = board
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
 end
end
