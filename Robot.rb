# frozen_string_literal: true

require './position'
# place the robot or takes in command.
class Robot
  attr_reader :position

  def initialize
    @position = Position.new
    @turn_right = { 'NORTH' => 'EAST', 'SOUTH' => 'WEST', 'EAST' => 'SOUTH', 'WEST' => 'NORTH' }
    @turn_left = { 'NORTH' => 'WEST', 'SOUTH' => 'EAST', 'EAST' => 'NORTH', 'WEST' => 'SOUTH' }
  end

  def place(value)
    @position = value
  end

  def move
  case @position.pos_f
  when 'NORTH'
    @position.position_y = @position.pos_y + 1 if @position.pos_y < 5
  when 'SOUTH'
    @position.position_y =  @position.pos_y - 1 if @position.pos_y > 0
  when 'EAST'
    @position.position_x = @position.pos_x+ 1 if @position.pos_x < 5
  when 'WEST'
    @position.position_x =  @position.pos_x-1 if @position.pos_x > 0
  end

  end

  def right
    @turn_right.each do |key, value|
      if @position.pos_f == key
        @position.position_f = value
        break
      end
    end
  end

  def left
    @turn_left.each do |key, value|
      if @position.pos_f == key
        @position.position_f = value
        break
      end
    end
  end

  def report
    @report = "Output: #{position.pos_x},#{position.pos_y},#{position.pos_f}"
  end
end
