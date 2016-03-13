require 'gosu'

class Click
  def initialize hit
    @hit = hit
  end

  def color
    case hit
    when true  then Gosu::Color::GREEN
    when false then Gosu::Color::RED
    else            Gosu::Color::NONE
    end
  end

  private

  attr_reader :hit
end
