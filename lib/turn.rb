class Turn
  def initialize(board:, current_player:, io_device:)
    @board = board
    @current_player = current_player
    @io_device = io_device
  end

  def play
    perform_move
    output
  end

  private
  attr_reader :board, :current_player, :io_device

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
    io_device.print_board(marks: board.spaces.map(&:formatted_mark))

    if board.matching_on_any_rows?
      io_device.print_winner(current_player)
    elsif board.filled_out?
      io_device.print_tie
    end
  end
end
