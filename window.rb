require 'gosu'
require_relative './click'
require_relative './hammer'
require_relative './ruby'

class Window < Gosu::Window
  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
    reset_click
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

  attr_accessor :click

  def button_down id
    return unless id == Gosu::MsLeft
    self.click = Click.new hit?
  end

  def draw
    [hammer, ruby].each(&:draw)
    handle_click
  end

  def handle_click
    color = click.color
    draw_quad lower_x, lower_y, color, upper_x, lower_y, color,
              upper_x, upper_y, color, lower_x, upper_y, color
    reset_click
  end

  def reset_click
    self.click = Click.new nil
  end

  def hit?
    distance = ruby.distance mouse_x, mouse_y
    distance < 50
  end

  def hammer
    @hammer ||= Hammer.new self
  end

  def ruby
    @ruby ||= Ruby.new self
  end

  def update
    ruby.update
  end

  def height
    600
  end

  def width
    800
  end
end
