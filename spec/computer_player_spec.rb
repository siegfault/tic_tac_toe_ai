require_relative '../lib/computer_player'

RSpec.describe ComputerPlayer do
  let(:player) { ComputerPlayer.new(mark: :cross) }

  context 'with many elements' do
    let(:available_moves) { [*(1..9)] }

    it 'should be one of those elements' do
      expect(available_moves).to include(player.move(available_moves))
    end
  end

  context 'with a single element' do
    let(:available_moves) { [:top_right] }

    it 'should be that element' do
      expect(player.move(available_moves)).to eq(:top_right)
    end
  end
end
