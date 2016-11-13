require_relative '../../lib/players/randomized'

RSpec.describe Players::Randomized do
  let(:input_device) { spy }
  let(:output_device) { spy }
  let(:computer_move) { spy }

  let(:player) { Players::Randomized.new(mark: :cross, input_device: input_device, output_device: output_device) }
  let(:board) { spy }

  it 'should create a move' do
    expect(Moves::Randomized).to receive(:new).with(board: board, input_device: input_device, output_device: output_device).and_return(computer_move)

    player.move(board: board)
  end

  it 'should call select on its move' do
    allow(Moves::Randomized).to receive(:new).with(board: board, input_device: input_device, output_device: output_device).and_return(computer_move)
    expect(computer_move).to receive(:select).with(no_args)

    player.move(board: board)
  end
end
