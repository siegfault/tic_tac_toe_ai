require_relative '../lib/player'

RSpec.describe Player do
  let(:input_device) { spy }
  let(:output_device) { spy }
  let(:mark) { spy }
  let(:player) { Player.new(mark: mark, input_device: input_device, output_device: output_device) }

  subject { player }

  it { is_expected.to respond_to(:mark) }
  it { is_expected.to respond_to(:input_device) }
  it { is_expected.to respond_to(:output_device) }
end
