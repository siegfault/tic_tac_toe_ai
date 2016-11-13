require_relative './computer_move.rb'
require_relative './player.rb'

class ComputerPlayer < Player
  def move(board:)
    ComputerMove.new(
      board: board,
      input_device: input_device,
      output_device: output_device
    ).select
  end
end
