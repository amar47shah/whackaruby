require 'gosu'

class Timer
  def initialize window
    @window = window
  end

  def draw
    draw_counter
    draw_game_over if finished?
  end

  def finished?
    remaining <= 0
  end

  def remaining
    actual = allowed - elapsed
    actual > 0 ? actual : 0
  end

  private

  attr_reader :window

  def allowed
    100
  end

  def draw_counter
    font.draw remaining, window.lower_x + 80, window.lower_y + 20, 2
  end

  def draw_game_over
    font.draw 'Game Over', window.center_x - 70, window.center_y, 3
  end

  def elapsed
    Gosu.milliseconds / 1000
  end

  def font
    @font ||= Gosu::Font.new 30
  end
end
