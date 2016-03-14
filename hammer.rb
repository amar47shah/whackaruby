require 'gosu'
require_relative './click'

class Hammer < Gosu::Image
  def initialize window
    super 'img/hammer.png'
    @window = window
    reset_click
  end

  def draw
    super x.lower, y.lower, 1
    handle_click
  end

  def register try
    self.click = Click.new try
  end

  private

  attr_accessor :click
  attr_reader :window

  def handle_click
    window.flash click.color
    reset_click
  end

  def reset_click
    register nil
  end

  def x
    Position.new window.mouse_x, width, 0.92, window.lower_x, window.upper_x
  end

  def y
    Position.new window.mouse_y, height, 0.46, window.lower_y, window.upper_y
  end
end
