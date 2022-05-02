# frozen_string_literal: true

require_relative '../robot'
require_relative '../position'
require_relative '../table'

RSpec.describe 'Robot moving and turning:' do
  it 'create a simple Robot object' do
    table = Table.new(5,5)
    robot = Robot.new(table)
    expect(robot).to be_kind_of(Robot)
  end

  it 'robot place' do
    position_current = Position.new(3,3,'NORTH')
    table = Table.new(5,5)
    robot = Robot.new(table)
    robot.place(position_current)
    expect(robot.position_current).to have_attributes(pos_x: 3,pos_y:3,pos_f:'NORTH')
  end

  it 'robot placed out of bound should raise error' do
    position_current = Position.new(6,2,'NORTH')
    table = Table.new(5,5)
    robot = Robot.new(table)
    expect{robot.place(position_current)}.to raise_error(RuntimeError)
  end

  it 'robot placed out of bound should raise error' do
    position_current = Position.new(2,6,'NORTH')
    table = Table.new(5,5)
    robot = Robot.new(table)
    expect{robot.place(position_current)}.to raise_error(RuntimeError)
  end

  it 'robot move out of bound X => 6' do
    position_current = Position.new(5,5,'EAST')
    table = Table.new(5,5)
    robot = Robot.new(table)
    robot.place(position_current)
    expect{robot.move}.to raise_error(RuntimeError)
  end

  it 'robot move out of bound Y=>6' do
    position_current = Position.new(5,5,'NORTH')
    table = Table.new(5,5)
    robot = Robot.new(table)
    robot.place(position_current)
    expect{robot.move}.to raise_error(RuntimeError)
  end

  it 'robot move NORTH' do
    position_current = Position.new(3,3,'NORTH')
    table = Table.new(5,5)
    robot = Robot.new(table)
    robot.place(position_current)
    position_next = robot.move
    expect(position_next).to have_attributes(:pos_x => 3,:pos_y => 4, :pos_f => 'NORTH') 
  end

  it 'robot turn RIGHT' do
    position_current = Position.new(3,3,'NORTH')
    table = Table.new(5,5)
    robot = Robot.new(table)
    robot.place(position_current)
    robot.right
    expect(robot.position_current).to have_attributes(:pos_x => 3,:pos_y => 3, :pos_f => "EAST")
  end

  it 'robot turn LEFT' do
    position_current = Position.new(3,3, 'WEST')
    table = Table.new(5,5)
    robot = Robot.new(table)
    robot.place(position_current)
    robot.left
    expect(robot.position_current).to have_attributes(:pos_x=>3,:pos_y=>3,:pos_f=>'SOUTH')
  end
end
