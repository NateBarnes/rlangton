require "cell"
require "plane"
require "position"

class Ant
  attr_reader :plane, :direction, :position

  def initialize plane=Plane.new, pos_x=50, pos_y=50
    @plane = plane
    @position = Position.new plane, pos_x, pos_y
    @direction = :south
  end

  def directions
    [:north, :east, :south, :west]
  end

  def run
    loop do
      move
    end rescue Exception

    self
  end

  def move
    current_cell.toggle_color
    position.advance direction

    if current_cell.white?
      turn :right
    else
      turn :left
    end
  end

  def turn turn_direction
    current_index = directions.index direction

    if turn_direction == :left
      @direction = directions[(current_index - 1) % directions.length]
    else
      @direction = directions[(current_index + 1) % directions.length]
    end
  end

  def current_cell
    plane.at(position)
  end
end

