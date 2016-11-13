class ComputerPlayer
  attr_reader :mark

  def initialize(mark:)
    @mark = mark
  end

  def move(available_moves)
    available_moves.sample
  end
end
