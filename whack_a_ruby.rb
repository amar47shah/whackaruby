require 'gosu'

class WhackARuby < Gosu::Window
  def initialize
    super 800, 600
    self.caption = 'Whack the Ruby!'
    @image = Gosu::Image.new 'ruby.png'
    @x, @y = 200, 200
    @width, @height = 50, 43
  end

  def draw
    @image.draw(@x - @width / 2, @y - @height / 2, 1)
  end
end

window = WhackARuby.new
window.show
