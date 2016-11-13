require_relative '../human_move'
require_relative '../player'

module Players
  class Human < Player
    def move(board:)
      HumanMove.new(
        board: board,
        input_device: input_device,
        output_device: output_device
      ).select
    end
  end
end
