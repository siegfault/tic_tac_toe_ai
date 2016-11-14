require_relative './../spec_helper'
require_relative '../../lib/players/randomized'

RSpec.describe Players::Randomized do
  let(:io_device) { spy }
  let(:computer_move) { spy }

  let(:player) { Players::Randomized.new(mark: :cross, io_device: io_device) }
  let(:board) { spy }

  it 'should create a move' do
    expect(Moves::Randomized).to receive(:new).with(board: board, io_device: io_device).and_return(computer_move)

    player.move(board: board)
  end

  it 'should call select on its move' do
    allow(Moves::Randomized).to receive(:new).with(board: board, io_device: io_device).and_return(computer_move)
    expect(computer_move).to receive(:select).with(no_args)

    player.move(board: board)
  end
end
