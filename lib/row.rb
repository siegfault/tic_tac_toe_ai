class Row
  def initialize(element1, element2, element3)
    @element1 = element1
    @element2 = element2
    @element3 = element3
  end

  def complete?
    elements.all?(&:naught?) || elements.all?(&:cross?)
  end

  private
  attr_reader :element1, :element2, :element3

  def elements
    [element1, element2, element3]
  end
end
