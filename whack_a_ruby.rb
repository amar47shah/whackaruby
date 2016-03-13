require 'gosu'
require_relative './ruby'

class WhackARuby < Gosu::Window
  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
  end

  private

  def draw
    ruby.draw
  end

  def update
    ruby.update width, height
  end

  def ruby
    @ruby ||= Ruby.new
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
