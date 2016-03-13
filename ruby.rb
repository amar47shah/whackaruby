require 'gosu'

class Ruby < Gosu::Image
  def initialize
    super 'ruby.png'
  end

  def draw x, y, z
    super coordinate(x, width), coordinate(y, height), z
  end

  private

  def coordinate position, distance
    position - distance / 2
  end

  def height
    43
  end

  def width
    50
  end
end
