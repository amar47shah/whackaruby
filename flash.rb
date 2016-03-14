require 'gosu'

class Flash
  def initialize hit_or_miss
    @swing = hit_or_miss
  end

  def color
    colors[swing]
  end

  private

  attr_reader :swing

  def colors
    { nil   => Gosu::Color::NONE,
      true  => Gosu::Color::GREEN,
      false => Gosu::Color::RED }
  end
end
