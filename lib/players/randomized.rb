require_relative '../computer_move'
require_relative '../player'

module Players
  class Randomized < Player
    def move(board:)
      ComputerMove.new(
        board: board,
        input_device: input_device,
        output_device: output_device
      ).select
    end
  end
end
