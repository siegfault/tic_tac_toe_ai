require_relative './move.rb'

class HumanMove < Move
  def select
    output_moves

    until valid_move?
      output_moves
    end

    selection.to_sym
  end

  private
  def output_moves
    output_device.print_moves(available_moves)
  end

  def valid_move?
    available_moves.include?(@selection = input_device.get)
  end
end
