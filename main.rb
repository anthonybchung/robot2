require './command.rb'


robot_command = Command.new
place_command = ''
report_alert = ''
#Get PLACE command loop.

while place_command != 'PLACE'
    begin
        puts "Place robot"
        ans = gets
        robot_command.command = ans
        place_command = robot_command.robot_command
    rescue
        puts "Enter 'PLACE 0,0,FACE'"
        retry
    end
end

#Command robot until report is received.
while report_alert != 'REPORT'
    begin
        puts "New robot command (MOVE,RIGHT,LEFT,REPORT)"
        ans = gets
        robot_command.command = ans
        report_alert = robot_command.robot_command
    rescue
        puts "Robot command: MOVE, RIGHT, LEFT, REPORT"
        retry
    end
end

