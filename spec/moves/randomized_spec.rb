require_relative '../../lib/moves/randomized'

RSpec.describe Moves::Randomized do
  let(:available_moves) { %i[a b] }
  let(:board) { spy(available_moves: available_moves) }
  let(:io_device) { spy }

  let(:move) { Moves::Randomized.new(board: board, io_device: io_device) }

  it 'selects a valid move' do
    expect(available_moves).to include(move.select)
  end
end
