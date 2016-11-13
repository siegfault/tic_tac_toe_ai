require_relative '../lib/computer_player'

RSpec.describe ComputerPlayer do
  let(:player) { ComputerPlayer.new(mark: :cross, input_device: nil, output_device: nil) }
  let(:board) { spy(available_moves: available_moves) }

  context 'with many elements' do
    let(:available_moves) { [:middle_middle, :top_left] }

    it 'should be one of those elements' do
      expect(available_moves).to include(player.move(board: board))
    end
  end

  context 'with a single element' do
    let(:available_moves) { [:top_right] }

    it 'should be that element' do
      expect(player.move(board: board)).to eq(:top_right)
    end
  end
end
