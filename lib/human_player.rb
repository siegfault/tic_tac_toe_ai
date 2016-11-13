require_relative './human_move.rb'
require_relative './player.rb'

class HumanPlayer < Player
  def move(board:)
    HumanMove.new(
      board: board,
      input_device: input_device,
      output_device: output_device
    ).select
  end
end
