# frozen_string_literal: true

# contains positon of robot
class Position
  attr_reader :pos_x, :pos_y, :pos_f

  def position_x=(value)
    @pos_x = value
    raise 'Must be integer between 0 and 5' unless pos_x.between?(0, 5)
  end

  def position_y=(value)
    @pos_y = value
    raise 'Must be integer between 0 and 5' unless @pos_y.between?(0, 5)
  end

  def position_f=(value)
    @pos_f = value
    raise 'Must be NORTH, EAST, SOUTH, or WEST' unless %w[NORTH SOUTH EAST WEST].include? value
  end
end
