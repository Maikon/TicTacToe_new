require 'qt'

class GuiDisplay < Qt::Widget

  def greet_players
    label = Qt::Label.new(self)
    label.text = "Welcome to Tic Tac Toe!"
  end

  def ask_for_game_type

  end

  def show_board(grid)

  end

  def ask_for_move(board)
    true
  end

  def invalid_move_message

  end
end
