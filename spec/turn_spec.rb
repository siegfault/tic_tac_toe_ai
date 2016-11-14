require_relative './spec_helper'
require_relative '../lib/turn'

RSpec.describe Turn do
  let(:location) { :middle_middle }
  let(:mark) { :naught }
  let(:space) { spy }

  let(:board) { spy }
  let(:player) { spy(mark: mark) }
  let(:io_device) { spy }

  let(:turn) { Turn.new(board: board, current_player: player, io_device: io_device) }

  it do
    expect(player).to receive(:move).with(board: board).and_return(location)
    expect(board).to receive(:space_for).with(location).and_return(space)
    expect(space).to receive(:occupy).with(mark)
    expect(io_device).to receive(:print_board)

    turn.play
  end

  context 'when the board is won' do
    before { allow(board).to receive(:matching_on_any_rows?).and_return(true) }

    it do
      expect(io_device).to receive(:print_winner).with(player)

      turn.play
    end
  end

  context 'when the board is filled' do
    before do
      allow(board).to receive(:matching_on_any_rows?).and_return(false)
      allow(board).to receive(:filled_out?).and_return(true)
    end

    it do
      expect(io_device).to receive(:print_tie).with(no_args)

      turn.play
    end
  end
end
