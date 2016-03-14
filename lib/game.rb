require 'gosu'
require_relative './hammer'
require_relative './ruby'
require_relative './score'
require_relative './timer'

class Game
  def initialize window
    @window = window
  end

  def draw
    [hammer, ruby, score, timer].each(&:draw)
  end

  def handle_click
    return if finished?
    score.adjust hit?
    hammer.swing hit?
  end

  def handle_space
    return unless finished?
    window.end_game
  end

  def update
    ruby.update
  end

  private

  attr_reader :window

  def finished?
    timer.finished?
  end

  def hammer
    @hammer ||= Hammer.new window
  end

  def hit?
    distance = ruby.distance window.mouse_x, window.mouse_y
    distance < 50
  end

  def ruby
    @ruby ||= Ruby.new window, timer
  end

  def score
    @score ||= Score.new window
  end

  def timer
    @timer ||= Timer.new window, Gosu.milliseconds
  end
end
