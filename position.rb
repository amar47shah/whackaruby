class Position
  def initialize point, range, proportion, lower_bound, upper_bound
    @point = point
    @range = range
    @proportion = proportion
    @lower_bound = lower_bound
    @upper_bound = upper_bound
  end

  def advance distance
    self.point += distance
  end

  def lower
    point - range * proportion
  end

  def upper
    point + range * (1 - proportion)
  end

  def out_of_bounds?
    lower < lower_bound || upper > upper_bound
  end

  protected

  attr_reader :point

  private

  attr_reader :range, :proportion, :lower_bound, :upper_bound
  attr_writer :point
end
