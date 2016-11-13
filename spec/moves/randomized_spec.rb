require_relative '../../lib/moves/randomized'

RSpec.describe Moves::Randomized do
  let(:available_moves) { %i[a b] }
  let(:board) { spy(available_moves: available_moves) }
  let(:input_device) { spy }
  let(:output_device) { spy }

  let(:move) { Moves::Randomized.new(board: board, input_device: input_device, output_device: output_device) }

  it 'selects a valid move' do
    expect(available_moves).to include(move.select)
  end
end
