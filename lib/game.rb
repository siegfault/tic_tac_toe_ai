require_relative './board.rb'

class Game
  def initialize(board:, player_cross:, player_naught:, output_device:)
    @board = board
    @player_cross = player_cross
    @player_naught = player_naught
    @player_order = [@player_naught, @player_cross]
    @output_device = output_device
  end

  def play
    until board.filled_out? || board.matching_on_any_rows?
      @player_order.reverse!
      current_player = player_order.first
      location = current_player.move(board: board)
      board.space_for(location).occupy(current_player.mark)
      output_device.print_board
    end
  end

  private
  attr_reader :board, :player_cross, :player_naught, :player_order, :output_device
end
