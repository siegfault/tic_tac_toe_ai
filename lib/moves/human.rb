module Moves
  class Human
    def initialize(board:, input_device:, output_device:)
      @board = board
      @input_device = input_device
      @output_device = output_device
    end

    def select
      output_moves

      until valid_move?
        output_moves
      end

      selection.to_sym
    end

    private
    attr_reader :board, :input_device, :selection, :output_device

    def available_moves
      @available_moves ||= board.available_moves
    end

    def output_moves
      output_device.print_moves(available_moves)
    end

    def valid_move?
      available_moves.include?(@selection = input_device.get)
    end
  end
end
