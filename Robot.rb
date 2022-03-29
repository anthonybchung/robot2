# frozen_string_literal: true

# Robot
class Robot
  attr_reader :positon_x, :position_y, :position_f
  def place(value_x,value_y,value_face)
    @position_x = value_x
    @position_y = value_y
    @position_f = value_face
  end

  def move
    case @position_f
    when 'NORTH'
      @position_y += @position_y < 5 ? 1 : 0
    when 'EAST'
      @position_x += @position_x < 5 ? 1 : 0
    when 'SOUTH'
      @position_y -= 1  if @position_y.positive?
    when 'WEST'
      @position_x -= 1  if @position_x.positive?
    end
  end

  def left
    @position_f = 'WEST'  if @position_f == 'NORTH'
    @position_f = 'NORTH' if @position_f == 'EAST'
    @position_f = 'EAST'  if @position_f == 'SOUTH'
    @position_f = 'SOUTH' if @position_f == 'WEST'
  end

  def right
    @position_f = 'WEST'  if @position_f == 'SOUTH'
    @position_f = 'SOUTH' if @position_f == 'EAST'
    @position_f = 'EAST'  if @position_f == 'NORTH'
    @position_f = 'NORTH' if @position_f == 'WEST'
  end

  def report
    @current_position = [@position_x,@position_y,@position_f]
  end
end
