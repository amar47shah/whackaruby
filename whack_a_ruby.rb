require 'gosu'
require_relative './ruby'

class WhackARuby < Gosu::Window
  attr_writer :x, :y, :velocity_x, :velocity_y

  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
  end

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

  def height
    600
  end

  def width
    800
  end

  def x_out_of_bounds?
    out_of_bounds? x, image.width, width
  end

  def y_out_of_bounds?
    out_of_bounds? y, image.height, height
  end

  def out_of_bounds? position, dimension, upper_bound
    half_dimension = dimension / 2
    position + half_dimension > upper_bound || position - half_dimension < 0
  end
end

window = WhackARuby.new
window.show
