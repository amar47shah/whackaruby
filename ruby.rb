require 'gosu'

class Ruby < Gosu::Image
  def initialize
    super 'ruby.png'
  end

  def draw x, y, z
    super coordinate_x(x), coordinate_y(y), z
  end

  def coordinate_x x
    coordinate x, width
  end

  def coordinate_y y
    coordinate y, height
  end

  def height
    43
  end

  def width
    50
  end

  private

  def coordinate position, distance
    position - distance / 2
  end
end
