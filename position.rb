class Position
  attr_accessor :center

  def initialize center, range, lower_bound, upper_bound
    @center = center
    @range = range
    @lower_bound = lower_bound
    @upper_bound = upper_bound
  end

  def lower
    center - range / 2
  end

  def upper
    center + range / 2
  end

  def out_of_bounds?
    lower < lower_bound || upper > upper_bound
  end

  private

  attr_reader :range, :lower_bound, :upper_bound
end
