class Visibility
  def initialize timer
    @timer = timer
    @high = 30
    @low = -10
  end

  def on?
    timer.finished? || ticker > 0
  end

  def update
    self.ticker -= 1
    reset_ticker if low? && lucky?
  end

  protected

  def ticker
    @ticker ||= high
  end

  private

  attr_reader :timer, :high, :low
  attr_writer :ticker

  def low?
    ticker < low
  end

  def lucky?
    rand < 0.05
  end

  def reset_ticker
    self.ticker = high
  end
end
