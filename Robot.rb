# frozen_string_literal: true

require_relative './position'
require_relative './command'
require_relative './table'


# robot is not smart, it can only move forward and turn.

class Robot
  attr_reader :position_current, :position_next, :command, :table

  def initialize(table)
    @table = table
    @command = Command.new
  end

  def place(position_current)
    @position_current = position_current
    raise "X Position is out of bound" unless position_current.pos_x.between?(0,table.width)
    raise "Y Position is out of bound" unless position_current.pos_y.between?(0,table.length)
  end

  def move
   @position_next = command.move(@position_current)
   raise "X Position is out of bound" unless position_next.pos_x.between?(0,table.width)
   raise "Y Position is out of bound" unless position_next.pos_y.between?(0,table.length)
   @position_current = @position_next
  end

  def right
    @position_current = command.turn(@position_current,'RIGHT')
  end

  def left
    @positon_current = command.turn(@position_current, 'LEFT')
  end
end
