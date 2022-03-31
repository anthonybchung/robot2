# frozen_string_literal: true

require './robot'
# commands the robot
# input strings robot follows
class Command
    attr_reader :robot_command
  def initialize
    @position = Position.new
    @robot = Robot.new
    @command_error_msg = "Command must be 'MOVE','RIGHT','LEFT','REPORT' or 'PLACE X,Y,FACE'"
  end

  def command=(value)
    @command_value = value.upcase.gsub(/\s+/, ' ').split(' ', 2)
    @robot_command = @command_value[0]
    @position_string = @command_value[1]
    raise @command_error_msg unless %w[MOVE RIGHT LEFT
                                       REPORT PLACE].include? @robot_command

   if @robot_command == 'PLACE' && !@position_string.nil?
    robot_position(@position_string) 
    @robot.place(@position)
   elsif @robot_command == 'REPORT'
        @output = @robot.report
        puts @output
   else
    @robot.public_send(@robot_command.downcase)
    end
end
  private

  def robot_position(value)
    @robot_position = value.gsub(/\s+/, '').split(',')
    @position.position_x = @robot_position[0].to_i
    @position.position_y = @robot_position[1].to_i
    @position.position_f = @robot_position[2]
  end
end

