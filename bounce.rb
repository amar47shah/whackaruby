class Bounce
  attr_reader :position, :velocity

  def initialize position, velocity
    @position = position
    @velocity = velocity
  end

  def lower_position
    @position.lower
  end

  def update
    move
    bounce if out_of_bounds?
  end

  private

  def bounce
    @velocity *= -1
  end

  def move
    @position.center += @velocity
  end

  def out_of_bounds?
    @position.out_of_bounds?
  end
end
