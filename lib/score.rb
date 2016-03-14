require 'gosu'

class Score
  def initialize window
    @window = window
    @value = 0
  end

  def adjust hit_or_miss
    self.value += hit_or_miss ? 5 : -1
  end

  def draw
    font.draw value, window.upper_x - 100, window.lower_y + 20, 2
  end

  protected

  attr_reader :value

  private

  attr_reader :window
  attr_writer :value

  def font
    @font ||= Gosu::Font.new 30
  end
end
