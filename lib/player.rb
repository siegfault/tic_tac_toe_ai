class Player
  attr_reader :mark, :input_device, :output_device

  def initialize(mark:, input_device:, output_device:)
    @mark = mark
    @input_device = input_device
    @output_device = output_device
  end
end
