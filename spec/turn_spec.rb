require_relative '../lib/turn'

RSpec.describe Turn do
  let(:location) { :middle_middle }
  let(:mark) { :naught }
  let(:space) { spy }

  let(:board) { spy }
  let(:player) { spy(mark: mark) }
  let(:output_device) { spy }

  let(:turn) { Turn.new(board: board, current_player: player, output_device: output_device) }

  it do
    expect(player).to receive(:move).with(board: board).and_return(location)
    expect(board).to receive(:space_for).with(location).and_return(space)
    expect(space).to receive(:occupy).with(mark)
    expect(output_device).to receive(:print_board)

    turn.play
  end
end
