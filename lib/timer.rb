require 'gosu'

class Timer
  def initialize window, start
    @window = window
    @start = start
  end

  def draw
    draw_counter
    draw_end if finished?
  end

  def finished?
    remaining <= 0
  end

  def remaining
    actual = allowed - elapsed
    actual > 0 ? actual : 0
  end

  private

  attr_reader :window, :start

  def allowed
    30
  end

  def draw_counter
    font.draw remaining, window.lower_x + 80, window.lower_y + 20, 2
  end

  def draw_end
    font.draw 'Game Over', window.center_x - 70, window.center_y - 30, 3
    font.draw 'Press SPACE to Play Again',
              window.center_x - 175, window.center_y + 20, 3
  end

  def elapsed
    (Gosu.milliseconds - start) / 1000
  end

  def font
    @font ||= Gosu::Font.new 30
  end
end
