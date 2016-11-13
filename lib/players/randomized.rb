require_relative '../moves/randomized'

module Players
  class Randomized
    attr_reader :mark, :input_device, :output_device

    def initialize(mark:, input_device:, output_device:)
      @mark = mark
      @input_device = input_device
      @output_device = output_device
    end

    def move(board:)
      Moves::Randomized.new(
        board: board,
        input_device: input_device,
        output_device: output_device
      ).select
    end
  end
end
