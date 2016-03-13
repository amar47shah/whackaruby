require 'gosu'
require_relative './motion'

class Ruby < Gosu::Image
  def initialize window
    super 'ruby.png'
    @window = window
  end

  def draw
    super lower_x, lower_y, 1
  end

  def update
    x.move
    y.move
    x.flip if x_out_of_bounds?
    y.flip if y_out_of_bounds?
  end

  def x
    @x ||= Motion.new 200, 5
  end

  def y
    @y ||= Motion.new 200, 5
  end

  private

  attr_reader :window

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

  def x_out_of_bounds?
    out_of_bounds? lower_x, upper_x, window.lower_x, window.upper_x
  end

  def y_out_of_bounds?
    out_of_bounds? lower_y, upper_y, window.lower_y, window.upper_y
  end

  def out_of_bounds? lower_coordinate, upper_coordinate, lower_bound, upper_bound
    lower_coordinate < lower_bound || upper_coordinate > upper_bound
  end
end
