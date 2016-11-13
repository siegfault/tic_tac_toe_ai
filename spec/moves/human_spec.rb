require_relative '../../lib/moves/human'

RSpec.describe Moves::Human do
  let(:available_moves) { %i[a b] }
  let(:board) { spy(available_moves: available_moves) }
  let(:input_device) { spy }
  let(:output_device) { spy }

  let(:move) { Moves::Human.new(board: board, input_device: input_device, output_device: output_device) }

  context 'with a valid selection' do
    let(:selection) { :a }
    before { allow(input_device).to receive(:get).and_return(selection) }

    it do
      expect(output_device).to receive(:print_moves).with(available_moves).once

      move.select
    end

    it do
      allow(output_device).to receive(:print_moves).with(available_moves).once

      expect(move.select).to eq(selection)
    end
  end

  context 'with an invalid selection' do
    before { allow(input_device).to receive(:get).and_return(:c, :d, :a) }

    it do
      expect(output_device).to receive(:print_moves).with(available_moves).exactly(3).times

      move.select
    end

    it do
      allow(output_device).to receive(:print_moves).with(available_moves).exactly(3).times

      expect(move.select).to eq(:a)
    end
  end
end
