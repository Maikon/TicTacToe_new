module TicTacToe
 class Game
   attr_reader :board

   def initialize(board)
     @board = board
   end

   def winner?
     board.winner?
   end
 end
end
