class Move
  def initialize(board:, input_device:, output_device:)
    @board = board
    @input_device = input_device
    @output_device = output_device
  end

  private
  attr_reader :board, :input_device, :selection, :output_device

  def available_moves
    @available_moves ||= board.available_moves
  end
end
