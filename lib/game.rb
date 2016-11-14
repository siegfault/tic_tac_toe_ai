require_relative './board'
require_relative './turn'

class Game
  def initialize(board:, player_cross:, player_naught:, io_device:)
    @board = board
    @player_cross = player_cross
    @player_naught = player_naught
    @player_order = [@player_naught, @player_cross]
    @io_device = io_device
  end

  def play
    until completed?
      swap_players
      play_turn
    end
  end

  private
  attr_reader :board, :player_cross, :player_naught, :player_order, :io_device

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
      io_device: io_device
    ).play
  end
end
