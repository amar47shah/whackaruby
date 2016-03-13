require 'gosu'
require_relative './ruby'

class WhackARuby < Gosu::Window
  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
  end

  private

  def draw
    image.draw
  end

  def update
    image.update width, height
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
end

window = WhackARuby.new
window.show
