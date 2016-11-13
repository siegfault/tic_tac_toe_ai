require_relative './board'
require_relative './turn'

class Game
  def initialize(board:, player_cross:, player_naught:, output_device:)
    @board = board
    @player_cross = player_cross
    @player_naught = player_naught
    @player_order = [@player_naught, @player_cross]
    @output_device = output_device
  end

  def play
    until completed?
      swap_players
      play_turn
    end
  end

  private
  attr_reader :board, :player_cross, :player_naught, :player_order, :output_device

  def completed?
    board.filled_out? || board.matching_on_any_rows?
  end

  def swap_players
    @player_order.reverse!
  end

  def play_turn
    Turn.new(
      board: board,
      current_player: player_order.first,
      output_device: output_device
    ).play
  end
end
