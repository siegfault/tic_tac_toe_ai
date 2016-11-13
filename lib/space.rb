class Space
  attr_reader :mark

  def initialize(location:, mark: nil)
    @location = location
    @mark = nil
  end

  def occupy(mark)
    acceptable_marks.include?(mark) && !occupied? && (self.mark = mark) && occupied?
  end

  def naught?
    mark == :naught
  end

  def cross?
    mark == :cross
  end

  private
  attr_reader :location
  attr_writer :mark

  def acceptable_marks
    %i[naught cross]
  end

  def occupied?
    !@mark.nil?
  end
end
