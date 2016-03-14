class Visibility
  def initialize
    @high = 30
    @low = -10
  end

  def on?
    ticker > 0
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

  attr_reader :high, :low
  attr_writer :ticker

  def low?
    ticker < low
  end

  def reset_ticker
    self.ticker = high
  end

  def lucky?
    rand < 0.05
  end
end
