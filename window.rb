require 'gosu'
require_relative './hammer'
require_relative './ruby'
require_relative './score'

class Window < Gosu::Window
  def initialize
    super width, height
    self.caption = 'Whack the Ruby!'
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

  private

  def button_down id
    return unless id == Gosu::MsLeft
    score.adjust hit?
    hammer.swing hit?
  end

  def draw
    [hammer, ruby, score].each(&:draw)
  end

  def hammer
    @hammer ||= Hammer.new self
  end

  def hit?
    distance = ruby.distance mouse_x, mouse_y
    distance < 50
  end

  def height
    600
  end

  def ruby
    @ruby ||= Ruby.new self
  end

  def score
    @score ||= Score.new self
  end

  def update
    ruby.update
  end

  def width
    800
  end
end
