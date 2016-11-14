module Moves
  class Randomized
    def initialize(board:, io_device:)
      @board = board
      @io_device = io_device
    end

    def select
      available_moves.sample.to_sym
    end

    private
    attr_reader :board, :io_device

    def available_moves
      @available_moves ||= board.available_moves
    end
  end
end
