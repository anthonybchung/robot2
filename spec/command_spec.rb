# frozen_string_literal: true

require_relative '../command'
require_relative '../position'

RSpec.describe 'Command: Receive a current position,instruction and returns a new position' do
  it 'create a new Command object' do
    command = Command.new
    expect(command).to be_kind_of(Command)
  end

  it 'Right command with FACE SOUTH' do
    command = Command.new
    position_current = Position.new(2, 2, 'SOUTH')
    new_position = command.turn(position_current, 'RIGHT')
    expect(new_position).to have_attributes(pos_x: 2, pos_y: 2, pos_f: 'WEST')
  end

  it 'LEFT command with FACE SOUTH' do
    command = Command.new
    position_current = Position.new(2, 2, 'SOUTH')
    new_position = command.turn(position_current, 'LEFT')
    expect(new_position).to have_attributes(pos_x: 2, pos_y: 2, pos_f: 'EAST')
  end

  it 'Move command with FACE NORTH' do
    command = Command.new
    position_current = Position.new(2, 2, 'NORTH')
    new_position = command.move(position_current)
    expect(new_position).to have_attributes(pos_x: 2, pos_y: 3, pos_f: 'NORTH')
  end

  it 'Move command with FACE SOUTH' do
    command = Command.new
    position_current = Position.new(3, 3, 'SOUTH')
    new_position = command.move(position_current)
    expect(new_position).to have_attributes(pos_x: 3, pos_y: 2, pos_f: 'SOUTH')
  end

  it 'MOVE command with FACE EAST' do
    command = Command.new
    position_current = Position.new(3, 3, 'EAST')
    new_position = command.move(position_current)
    expect(new_position).to have_attributes(pos_x: 4, pos_y: 3, pos_f: 'EAST')
  end

  it 'MOVE command with FACE WEST' do
    command = Command.new
    position_current = Position.new(3, 3, 'WEST')
    new_position = command.move(position_current)
    expect(new_position).to have_attributes(pos_x: 2, pos_y: 3, pos_f: 'WEST')
  end
end
