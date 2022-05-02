# frozen_string_literal: true

require_relative './position'

# receives a current position and return next position
class Command
  attr_reader :position_current, :instruction, :position_next, :table

  def initialize(table)
    @FACE_RIGHT = { 'NORTH' => 'EAST', 'EAST' => 'SOUTH', 'SOUTH' => 'WEST', 'WEST' => 'NORTH' }
    @FACE_LEFT = { 'NORTH' => 'WEST', 'EAST' => 'NORTH', 'SOUTH' => 'EAST', 'WEST' => 'SOUTH' }
    @position_next = Position.new
    @table = table
  end

  def turn(position_current, instruction)
    @position_current = position_current
    @instruction = instruction
    @position_next = position_current

    case @instruction
    when 'RIGHT'
      @position_next.pos_f = @FACE_RIGHT[@position_current.pos_f]
    when 'LEFT'
      @position_next.pos_f = @FACE_LEFT[@position_current.pos_f]
    end
    @position_next
  end

  def move(position_current)
    @position_current = position_current
    @position_next = position_current
    if @position_current.pos_f == 'NORTH' && @position_current.pos_y < table.length
      @position_next.pos_y += 1
    end

    if @position_current.pos_f == 'SOUTH' && @position_current.pos_y > 0
      @position_next.pos_y -= 1
    end

    if @position_current.pos_f == 'EAST' && @position_current.pos_x < table.width
      @position_next.pos_x += 1
    end

    if @position_current.pos_f == 'WEST' && @position_current.pos_x > 0
      @position_next.pos_x -= 1
    end
    @position_next
  end
end
