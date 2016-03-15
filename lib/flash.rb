require 'gosu'

class Flash
  def initialize window
    @window = window
  end

  def draw
    window.burst color
    reset_signal
  end

  def receive signal
    self.signal = signal
  end

  private

  attr_accessor :signal
  attr_reader :window

  def color
    colors[signal]
  end

  def colors
    { nil   => Gosu::Color::NONE,
      true  => Gosu::Color::GREEN,
      false => Gosu::Color::RED }
  end

  def reset_signal
    self.signal = nil
  end
end
