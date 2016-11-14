require_relative '../lib/console_output'

RSpec.describe ConsoleOutput do
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
        ConsoleOutput.new.print_board(marks: marks)
      }.to output(expected_output).to_stdout
    end
  end

  describe '#print_moves' do
    let(:moves) { [:a, :b] }

    it do
      expect {
        ConsoleOutput.new.print_moves(moves)
      }.to output("a b\n").to_stdout
    end
  end

  describe '#print_winner' do
    let(:player) { spy }

    it do
      expect {
        ConsoleOutput.new.print_winner(player)
      }.to output("winner!\n").to_stdout
    end
  end

  describe '#print_tie' do
    it do
      expect {
        ConsoleOutput.new.print_tie
      }.to output("tie!\n").to_stdout
    end
  end
end
