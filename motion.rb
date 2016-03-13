class Motion
  attr_reader :position, :velocity

  def initialize position, velocity
    @position = position
    @velocity = velocity
  end

  def move
    @position += @velocity
  end

  def flip
    @velocity *= -1
  end
end
