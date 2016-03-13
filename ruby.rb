require 'gosu'

class Ruby < Gosu::Image
  def initialize
    super 'ruby.png'
  end

  def draw x, y, z
    super lower_x(x), lower_y(y), z
  end

  def height
    43
  end

  def width
    50
  end

  def lower_x x
    lower x, width
  end

  def upper_x x
    upper x, width
  end

  def lower_y y
    lower y, height
  end

  def upper_y y
    upper y, height
  end

  private

  def lower center, dimension
    center - dimension / 2
  end

  def upper center, dimension
    center + dimension / 2
  end
end
