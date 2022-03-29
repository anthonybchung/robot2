# frozen_string_literal: true

# Position of robot, X, Y, FACE
class Position
  attr_reader :pos_x, :pos_y, :pos_f

  def pos_x=(value)
    raise 'Argument is NOT an Integer' unless value.is_a?(Integer)

    @pos_x = value
  end

  def pos_y=(value)
    raise 'Argument is NOT an integer' unless value.is_a?(Integer)

    @pos_y = value
  end

  def pos_f=(value)
    raise "Argument must be 'NORTH' 'EAST' 'SOUTH' or 'WEST'" unless %w[NORTH EAST SOUTH WEST].include?(value)

    @pos_f = value
  end
end
