module TicTacToe
 class Computer
   attr_reader :mark

   def choose_mark(board)
     board.available_moves.length.odd? ? @mark = 'X' : @mark = 'O'
   end

   def make_move(board)
     best_move = minimax(board)
     board.mark_position(best_move, mark)
   end

   def minimax(board)
     alpha_beta(board).first
   end

   def alpha_beta(board, depth = 0, alpha = -10.0, beta = 10.0)
     return [0, 10.0 / depth] if board.win_for(mark)
     return [0, -10.0 / depth] if board.win_for(opponent)
     return [0, 0] if board.draw?

     best_move = -1

     if board.current_mark == mark
       best_score = alpha
       board.available_moves.each do |move|
         board.mark_position(move, board.current_mark)
         rated_results = alpha_beta(board, depth + 1, alpha, beta)
         board.reset_value(move)
         if rated_results[1] > alpha
           alpha = rated_results[1]
           best_score = rated_results[1]
           best_move = move
         end
         if alpha >= beta
           break
         end
       end
     else
       best_score = beta
       board.available_moves.each do |move|
         board.mark_position(move, board.current_mark)
         rated_results = alpha_beta(board, depth + 1, alpha, beta)
         board.reset_value(move)
         if rated_results[1] < beta
           beta = rated_results[1]
           best_score = rated_results[1]
           best_move = move
         end
         if alpha >= beta
           break
         end
       end
     end
     [best_move, best_score]
   end

   private

   def opponent
     @mark == 'X' ? 'O' : 'X'
   end
 end
end
