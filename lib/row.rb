class Row
  def initialize(element1, element2, element3)
    @element1 = element1
    @element2 = element2
    @element3 = element3
  end

  def complete?
    all_cross? || all_naught?
  end

  def winning_mark
    if all_cross?
      :cross
    elsif all_naught?
      :naught
    end
  end

  private
  attr_reader :element1, :element2, :element3

  def elements
    [element1, element2, element3]
  end

  def all_cross?
    elements.all?(&:cross?)
  end

  def all_naught?
    elements.all?(&:naught?)
  end
end
