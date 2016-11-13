require_relative './board.rb'
require_relative './computer_player.rb'

class Game
  def initialize(board:, player_cross:, player_naught:)
    @board = board
    @player_cross = player_cross
    @player_naught = player_naught
    @player_order = [@player_naught, @player_cross]
  end

  def play
    until board.filled_out? || board.matching_on_any_rows?
      @player_order.reverse!
      current_player = player_order.first
      location = current_player.move(board.available_moves)
      board.space_for(location).occupy(current_player.mark)
    end

    puts current_player.mark
  end

  private
  attr_reader :board, :player_cross, :player_naught, :player_order
end
