require 'gosu'
require_relative './game'

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

  def center_x
    (upper_x - lower_x) / 2
  end

  def center_y
    (upper_y - lower_y) / 2
  end

  def upper_x
    width
  end

  def upper_y
    height
  end

  private

  def button_down id
    game.handle_click if id == Gosu::MsLeft
  end

  def draw
    game.draw
  end

  def game
    @game ||= Game.new self
  end

  def height
    600
  end

  def update
    game.update
  end

  def width
    800
  end
end
