require 'gosu'

class Timer
  def initialize window
    @window = window
  end

  def draw
    font.draw remaining, window.lower_x + 80, window.lower_y + 20, 2
  end

  def finished?
    remaining > 0
  end

  def remaining
    allowed - elapsed
  end

  private

  attr_reader :window

  def allowed
    100
  end

  def font
    @font ||= Gosu::Font.new 30
  end

  def elapsed
    Gosu.milliseconds / 1000
  end
end
