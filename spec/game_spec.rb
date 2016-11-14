require_relative '../lib/game'

RSpec.describe Game do
  let(:board) { spy }
  let(:cross) { spy }
  let(:naught) { spy }
  let(:io_device) { spy }
  let(:turn) { spy }

  let(:game) do
    Game.new(
      board: board,
      player_cross: cross,
      player_naught: naught,
      io_device: io_device
    )
  end

  it do
    allow(turn).to receive(:play).exactly(3).times

    expect(board).to receive(:filled_out?).exactly(4).times.and_return(false, false, false, false)
    expect(board).to receive(:matching_on_any_rows?).exactly(4).times.and_return(false, false, false, true)

    expect(Turn).to receive(:new).with(board: board, current_player: cross, io_device: io_device).and_return(turn).ordered
    expect(Turn).to receive(:new).with(board: board, current_player: naught, io_device: io_device).and_return(turn).ordered
    expect(Turn).to receive(:new).with(board: board, current_player: cross, io_device: io_device).and_return(turn).ordered

    game.play
  end
end
