class Position
  attr_accessor :x, :y

  def initialize plane, x, y
    @plane = plane
    @x = x
    @y = y

    check_bounds
  end

  def advance direction
    if direction == :north
      @y -= 1
    elsif direction == :east
      @x += 1
    elsif direction == :south
      @y += 1
    else
      @x -= 1
    end

    check_bounds
  end

  def check_bounds
    raise unless check_horizontal_bounds and check_vertical_bounds
  end

  def to_s
    "(%d, %d)" % [x, y]
  end

private
  def check_horizontal_bounds
    0 <= @x and @x < @plane.x
  end

  def check_vertical_bounds
    0 <= @y and @y < @plane.y
  end
end

