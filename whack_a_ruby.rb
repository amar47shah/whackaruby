require 'gosu'
require_relative './ruby'

class WhackARuby < Gosu::Window
  attr_writer :x, :y

  def initialize
    super 800, 600
    self.caption = 'Whack the Ruby!'
  end

  def draw
    image.draw x, y, 1
  end

  def update
    self.x += velocity_x
    self.y += velocity_y
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
    5
  end

  def velocity_y
    5
  end
end

window = WhackARuby.new
window.show
