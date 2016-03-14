require 'gosu'
require_relative './hammer'
require_relative './ruby'

class Window < Gosu::Window
  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
    @score = 0
  end

  def burst color
    draw_quad lower_x, lower_y, color, upper_x, lower_y, color,
              upper_x, upper_y, color, lower_x, upper_y, color
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

  protected

  attr_reader :score

  private

  attr_writer :score

  def adjust_score hit
    self.score += hit ? 5 : -1
  end

  def button_down id
    return unless id == Gosu::MsLeft
    adjust_score hit?
    hammer.swing hit?
  end

  def display_score
    font.draw "#{score}", upper_x - 100, lower_y + 20, 2
  end

  def draw
    [hammer, ruby].each(&:draw)
    display_score
  end

  def font
    @font ||= Gosu::Font.new 30
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
