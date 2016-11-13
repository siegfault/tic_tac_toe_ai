class Turn
  def initialize(board:, current_player:, output_device:)
    @board = board
    @current_player = current_player
    @output_device = output_device
  end

  def play
    perform_move
    output
  end

  private
  attr_reader :board, :current_player, :output_device

  def perform_move
    space.occupy(mark)
  end

  def space
    board.space_for(location)
  end

  def mark
    current_player.mark
  end

  def location
    current_player.move(board: board)
  end

  def output
    output_device.print_board
  end
end
