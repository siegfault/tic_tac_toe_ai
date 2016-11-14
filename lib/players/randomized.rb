require_relative '../moves/randomized'

module Players
  class Randomized
    attr_reader :mark, :io_device

    def initialize(mark:, io_device:)
      @mark = mark
      @io_device = io_device
    end

    def move(board:)
      Moves::Randomized.new(
        board: board,
        io_device: io_device
      ).select
    end
  end
end
