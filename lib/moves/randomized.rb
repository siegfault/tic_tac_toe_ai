require_relative './base'

module Moves
  class Randomized < Base
    def select
      available_moves.sample.to_sym
    end
  end
end
