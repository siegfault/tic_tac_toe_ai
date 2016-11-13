require_relative '../lib/row'

RSpec.describe Row do
  let(:row) { Row.new(element1, element2, element3) }

  context 'when empty' do
    let(:element1) { double(cross?: false, naught?: false) }
    let(:element2) { double(cross?: false, naught?: false) }
    let(:element3) { double(cross?: false, naught?: false) }

    it do
      expect(row).to_not be_complete
    end
  end

  context 'when filled but not by the same mark' do
    let(:element1) { double(cross?: false, naught?: true) }
    let(:element2) { double(cross?: true, naught?: false) }
    let(:element3) { double(cross?: true, naught?: false) }

    it do
      expect(row).to_not be_complete
    end
  end

  context 'when filled by the same mark' do
    let(:element1) { double(cross?: true, naught?: false) }
    let(:element2) { double(cross?: true, naught?: false) }
    let(:element3) { double(cross?: true, naught?: false) }

    it do
      expect(row).to be_complete
    end
  end
end
