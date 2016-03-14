require 'gosu'
require_relative './bounce'
require_relative './position'
require_relative './visibility'

class Ruby < Gosu::Image
  def initialize window
    super 'img/ruby.png'
    @window = window
  end

  def distance other_x, other_y
    Gosu.distance other_x, other_y, x.point, y.point
  end

  def draw
    return unless visibility.on?
    super x.lower_position, y.lower_position, 1
  end

  def update
    [x, y, visibility].each(&:update)
  end

  private

  attr_reader :window

  def height
    43
  end

  def initial_speed
    5
  end

  def initial_x_position
    Position.new 200, width, 0.5, window.lower_x, window.upper_x
  end

  def initial_y_position
    Position.new 200, height, 0.5, window.lower_y, window.upper_y
  end

  def visibility
    @visibility ||= Visibility.new
  end

  def width
    50
  end

  def x
    @x ||= Bounce.new initial_x_position, initial_speed
  end

  def y
    @y ||= Bounce.new initial_y_position, initial_speed
  end
end
