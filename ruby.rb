require 'gosu'

class Ruby < Gosu::Image
  def initialize
    super 'ruby.png'
  end

  def draw
    super lower_x, lower_y, 1
  end

  def update window_width, window_height
    self.x += velocity_x
    self.y += velocity_y
    self.velocity_x *= -1 if x_out_of_bounds? window_width
    self.velocity_y *= -1 if y_out_of_bounds? window_height
  end

  def x
    @x ||= 200
  end

  def y
    @y ||= 200
  end

  def velocity_x
    @velocity_x ||= 5
  end

  def velocity_y
    @velocity_y ||= 5
  end

  private

  attr_writer :x, :y, :velocity_x, :velocity_y

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

  def out_of_bounds? lower, upper, upper_bound
    lower < 0 || upper > upper_bound
  end
end
