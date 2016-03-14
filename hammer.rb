require 'gosu'
require_relative './flash'

class Hammer < Gosu::Image
  def initialize window
    super 'img/hammer.png'
    @window = window
    reset_flash
  end

  def draw
    super x.lower, y.lower, 1
    handle_flash
  end

  def swing hit_or_miss
    self.flash = Flash.new hit_or_miss
  end

  private

  attr_accessor :flash
  attr_reader :window

  def handle_flash
    window.burst flash.color
    reset_flash
  end

  def reset_flash
    swing nil
  end

  def x
    Position.new window.mouse_x, width, 0.92, window.lower_x, window.upper_x
  end

  def y
    Position.new window.mouse_y, height, 0.46, window.lower_y, window.upper_y
  end
end
