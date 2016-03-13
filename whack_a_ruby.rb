require 'gosu'
require_relative './ruby'

class WhackARuby < Gosu::Window
  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
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

  def draw
    image.draw x, y, 1
  end

  def update
    self.x += velocity_x
    self.y += velocity_y
    self.velocity_x *= -1 if x_out_of_bounds?
    self.velocity_y *= -1 if y_out_of_bounds?
  end

  def image
    @image ||= Ruby.new
  end

  def height
    600
  end

  def width
    800
  end

  def x_out_of_bounds?
    out_of_bounds? image.lower_x(x), image.upper_x(x), width
  end

  def y_out_of_bounds?
    out_of_bounds? image.lower_y(y), image.upper_y(y), height
  end

  def out_of_bounds? lower, upper, upper_bound
    lower < 0 || upper > upper_bound
  end
end

window = WhackARuby.new
window.show
