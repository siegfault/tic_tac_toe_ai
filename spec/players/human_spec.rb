require_relative './../spec_helper'
require_relative '../../lib/players/human'

RSpec.describe Players::Human do
  let(:io_device) { spy }
  let(:human_move) { spy }

  let(:player) { Players::Human.new(mark: :naught, io_device: io_device) }
  let(:board) { spy }

  it 'should create a move' do
    expect(Moves::Human).to receive(:new).with(board: board, io_device: io_device).and_return(human_move)

    player.move(board: board)
  end

  it 'should call select on its move' do
    allow(Moves::Human).to receive(:new).with(board: board, io_device: io_device).and_return(human_move)
    expect(human_move).to receive(:select).with(no_args)

    player.move(board: board)
  end
end
