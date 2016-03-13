require 'gosu'

class Ruby < Gosu::Image
  attr_writer :x, :y

  def initialize
    super 'ruby.png'
  end

  def draw
    super lower_x, lower_y, 1
  end

  def x
    @x ||= 200
  end

  def y
    @y ||= 200
  end

  def height
    43
  end

  def width
    50
  end

  def lower_x
    lower x, width
  end

  def upper_x
    upper x, width
  end

  def lower_y
    lower y, height
  end

  def upper_y
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
