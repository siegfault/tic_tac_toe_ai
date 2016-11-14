module Moves
  class Human
    def initialize(board:, io_device:)
      @board = board
      @io_device = io_device
    end

    def select
      output_moves

      until valid_move?
        output_moves
      end

      selection.to_sym
    end

    private
    attr_reader :board, :io_device, :selection

    def available_moves
      @available_moves ||= board.available_moves
    end

    def output_moves
      io_device.print_moves(available_moves)
    end

    def valid_move?
      available_moves.include?(@selection = io_device.get)
    end
  end
end
