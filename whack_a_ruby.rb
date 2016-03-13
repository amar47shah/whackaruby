require 'gosu'
require_relative './ruby'

class WhackARuby < Gosu::Window
  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
  end

  def lower_x
    0
  end

  def lower_y
    0
  end

  def upper_x
    width
  end

  def upper_y
    height
  end

  private

  def draw
    ruby.draw
  end

  def update
    ruby.update
  end

  def ruby
    @ruby ||= Ruby.new self
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
