require 'gosu'

class Hammer < Gosu::Image
  def initialize window
    super 'img/hammer.png'
    @window = window
  end

  def draw
    super x.lower, y.lower, 1
  end

  private

  attr_reader :window

  def x
    Position.new window.mouse_x, width, 0.92, window.lower_x, window.upper_x
  end

  def y
    Position.new window.mouse_y, height, 0.46, window.lower_y, window.upper_y
  end
end
