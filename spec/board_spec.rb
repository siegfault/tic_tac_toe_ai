require_relative './spec_helper'
require_relative '../lib/board'

RSpec.describe Board do
  describe '#matching_on_any_row?' do
    let(:board) { Board.new(rows: [row1, row2]) }

    context 'when no rows are complete' do
      let(:row1) { double(complete?: false) }
      let(:row2) { double(complete?: false) }

      it do
        expect(board).to_not be_matching_on_any_rows
      end
    end

    context 'when some rows are complete' do
      let(:row1) { double(complete?: true) }
      let(:row2) { double(complete?: false) }

      it do
        expect(board).to be_matching_on_any_rows
      end
    end

    context 'when all rows are complete' do
      let(:row1) { double(complete?: true) }
      let(:row2) { double(complete?: false) }

      it do
        expect(board).to be_matching_on_any_rows
      end
    end
  end

  describe '#filled_out?' do
    let(:board) { Board.new(spaces: [space1, space2]) }

    context 'when no spaces are occupied' do
      let(:space1) { double(occupied?: false) }
      let(:space2) { double(occupied?: false) }

      it do
        expect(board).to_not be_filled_out
      end
    end

    context 'when some spaces are occupied' do
      let(:space1) { double(occupied?: false) }
      let(:space2) { double(occupied?: true) }

      it do
        expect(board).to_not be_filled_out
      end
    end

    context 'when all spaces are occupied' do
      let(:space1) { double(occupied?: true) }
      let(:space2) { double(occupied?: true) }

      it do
        expect(board).to be_filled_out
      end
    end
  end

  describe '#winning_mark' do
    let(:board) { Board.new(rows: [row1, row2]) }
    let(:row1) { double(winning_mark: nil) }
    let(:row2) { double(winning_mark: :naught) }

    it 'finds the winning mark' do
      expect(board.winning_mark).to be(:naught)
    end
  end

  describe '#available_moves' do
    let(:board) { Board.new(spaces: [space1, space2, space3]) }
    let(:space1) { double(occupied?: false, location: :top) }
    let(:space2) { double(occupied?: true, location: :middle) }
    let(:space3) { double(occupied?: false, location: :bottom) }

    it 'should return the available moves' do
      expect(board.available_moves).to match_array(%w[top bottom])
    end
  end

  describe '#space_for' do
    let(:board) { Board.new(spaces: [space1, space2, space3]) }
    let(:space1) { double(location: :top) }
    let(:space2) { double(location: :middle) }
    let(:space3) { double(location: :bottom) }

    it 'should fine the space' do
      expect(board.space_for(:bottom)).to be(space3)
    end
  end
end
