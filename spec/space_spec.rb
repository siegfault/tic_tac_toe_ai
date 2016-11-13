require_relative '../lib/space'

RSpec.describe Space do
  let(:space) { Space.new(location: :top_left) }

  context 'when occupied' do
    before { space.occupy(mark) }

    context 'by naught' do
      let(:mark) { :naught }

      it do
        expect(space).to be_naught
      end

      it do
        expect(space).to_not be_cross
      end

      it do
        expect(space).to be_occupied
      end

      it 'should not be able to be occupied' do
        expect(space.occupy(:naught)).to be false
      end
    end

    context 'by cross' do
      let(:mark) { :cross }

      it do
        expect(space).to be_cross
      end

      it do
        expect(space).to_not be_naught
      end

      it do
        expect(space).to be_occupied
      end

      it 'should not be able to be occupied' do
        expect(space.occupy(:naught)).to be false
      end
    end
  end

  context 'when not occupied' do
    it 'should be occupyable by naught' do
      expect(space.occupy(:naught)).to be true
    end

    it 'should be occupyable by cross' do
      expect(space.occupy(:cross)).to be true
    end

    it do
      expect(space).to_not be_occupied
    end

    it 'should not be occupyable by an invalid mark' do
      expect(space.occupy(:foo)).to be false
    end
  end
end
