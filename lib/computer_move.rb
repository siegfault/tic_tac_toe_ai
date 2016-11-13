require_relative './move.rb'

class ComputerMove < Move
  def select
    available_moves.sample.to_sym
  end
end
