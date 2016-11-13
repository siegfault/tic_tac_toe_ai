require_relative '../../lib/players/human'

RSpec.describe Players::Human do
  let(:input_device) { spy }
  let(:output_device) { spy }
  let(:human_move) { spy }

  let(:player) { Players::Human.new(mark: :naught, input_device: input_device, output_device: output_device) }
  let(:board) { spy }

  it 'should create a move' do
    expect(Moves::Human).to receive(:new).with(board: board, input_device: input_device, output_device: output_device).and_return(human_move)

    player.move(board: board)
  end

  it 'should call select on its move' do
    allow(Moves::Human).to receive(:new).with(board: board, input_device: input_device, output_device: output_device).and_return(human_move)
    expect(human_move).to receive(:select).with(no_args)

    player.move(board: board)
  end
end
