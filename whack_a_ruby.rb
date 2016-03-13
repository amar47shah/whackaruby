require 'gosu'
require_relative './ruby'

class WhackARuby < Gosu::Window
  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
  end

  def velocity_x
    @velocity_x ||= 5
  end

  def velocity_y
    @velocity_y ||= 5
  end

  private

  attr_writer :velocity_x, :velocity_y

  def draw
    image.draw
  end

  def update
    image.x += velocity_x
    image.y += velocity_y
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
    out_of_bounds? image.lower_x, image.upper_x, width
  end

  def y_out_of_bounds?
    out_of_bounds? image.lower_y, image.upper_y, height
  end

  def out_of_bounds? lower, upper, upper_bound
    lower < 0 || upper > upper_bound
  end
end

window = WhackARuby.new
window.show
