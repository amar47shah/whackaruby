require 'gosu'
require_relative './ruby'

class WhackARuby < Gosu::Window
  def initialize
    super 800, 600
    self.caption = 'Whack the Ruby!'
  end

  def draw
    image.draw x, y, 1
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
end

window = WhackARuby.new
window.show
