require 'gosu'
require_relative './motion'
require_relative './position'

class Ruby < Gosu::Image
  def initialize window
    super 'ruby.png'
    @window = window
  end

  def draw
    super x.lower_position, y.lower_position, 1
  end

  def update
    [x, y].each(&:update)
  end

  def x
    @x ||= Motion.new initial_x_position, 5
  end

  def y
    @y ||= Motion.new initial_y_position, 5
  end

  private

  attr_reader :window

  def height
    43
  end

  def width
    50
  end

  def initial_x_position
    Position.new 200, width, window.lower_x, window.upper_x
  end

  def initial_y_position
    Position.new 200, height, window.lower_y, window.upper_y
  end
end
