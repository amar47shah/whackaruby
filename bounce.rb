class Bounce
  def initialize position, velocity
    @position = position
    @velocity = velocity
  end

  def lower_position
    position.lower
  end

  def point
    position.point
  end

  def update
    move
    bounce if out_of_bounds?
  end

  protected

  attr_reader :velocity

  private

  attr_reader :position
  attr_writer :velocity

  def bounce
    self.velocity *= -1
  end

  def move
    position.advance velocity
  end

  def out_of_bounds?
    position.out_of_bounds?
  end
end
