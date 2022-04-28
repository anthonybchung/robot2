# frozen_string_literal: true

require_relative './position'

# receives a current position and return next position
class Command
  attr_reader :position_current, :instruction, :position_next

  def initialize
    @FACE_RIGHT = { 'NORTH' => 'EAST', 'EAST' => 'SOUTH', 'SOUTH' => 'WEST', 'WEST' => 'NORTH' }
    @FACE_LEFT = { 'NORTH' => 'WEST', 'EAST' => 'NORTH', 'SOUTH' => 'EAST', 'WEST' => 'SOUTH' }
    @MOVE = {'NORTH'=> [0,1],'EAST'=> [1,0], 'SOUTH' => [0,-1], 'WEST' => [-1,0]}
    @position_next = Position.new
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
    @position_next.pos_x =  @position_current.pos_x + @MOVE.dig(position_current.pos_f,0) 
    @position_next.pos_y =  @position_current.pos_y + @MOVE.dig(position_current.pos_f,1) 
    @position_next
  end
end
