require_relative './../spec_helper'
require_relative '../../lib/io_devices/console'

RSpec.describe IoDevices::Console do
  describe '#get' do
    subject { described_class.new }
    before { allow(subject).to receive(:gets).and_return("foo\n") }

    it do
      expect(subject.get).to eq('foo')
    end
  end

  describe '#print_board' do
    let(:marks) do
      [
        'x', 'o', ' ',
        'o', ' ', 'x',
        'o', 'x', 'x'
      ]
    end
    let(:expected_output) do
      [
        'x | o |  ',
        '--|---|--',
        'o |   | x',
        '--|---|--',
        'o | x | x'
      ].join("\n") + "\n"
    end

    it do
      expect {
        IoDevices::Console.new.print_board(marks: marks)
      }.to output(expected_output).to_stdout
    end
  end

  describe '#print_moves' do
    let(:moves) { [:a, :b] }

    it do
      expect {
        IoDevices::Console.new.print_moves(moves)
      }.to output("a b\n").to_stdout
    end
  end

  describe '#print_winner' do
    let(:player) { spy }

    it do
      expect {
        IoDevices::Console.new.print_winner(player)
      }.to output("winner!\n").to_stdout
    end
  end

  describe '#print_tie' do
    it do
      expect {
        IoDevices::Console.new.print_tie
      }.to output("tie!\n").to_stdout
    end
  end
end
