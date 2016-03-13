require 'gosu'
require_relative './motion'

class Ruby < Gosu::Image
  def initialize
    super 'ruby.png'
  end

  def draw
    super lower_x, lower_y, 1
  end

  def update window_width, window_height
    x.update
    y.update
    x.flip if x_out_of_bounds? window_width
    y.flip if y_out_of_bounds? window_height
  end

  def x
    @x ||= Motion.new 200, 5
  end

  def y
    @y ||= Motion.new 200, 5
  end

  private

  def height
    43
  end

  def width
    50
  end

  def lower_x
    lower x.position, width
  end

  def upper_x
    upper x.position, width
  end

  def lower_y
    lower y.position, height
  end

  def upper_y
    upper y.position, height
  end

  def lower center, dimension
    center - dimension / 2
  end

  def upper center, dimension
    center + dimension / 2
  end

  def x_out_of_bounds? width
    out_of_bounds? lower_x, upper_x, width
  end

  def y_out_of_bounds? height
    out_of_bounds? lower_y, upper_y, height
  end

  def out_of_bounds? lower_coordinate, upper_coordinate, upper_bound
    lower_coordinate < 0 || upper_coordinate > upper_bound
  end
end
