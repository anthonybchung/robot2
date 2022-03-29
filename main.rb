require './robot.rb'
require './instruction.rb'
require './position.rb'

current_instruction = Instruction.new
robot = Robot.new
answer_valid = false
answer_main_valid = false
report_position = []

# First instruction must be PLACE X,Y,FACE
# keep on asking then go to next

while (!answer_valid)
    puts "Enter instruction (PLACE X,Y,FACE):"
    ans = gets.chomp
    current_instruction.instruction = ans
    #check input if it is the right place format.
    command = current_instruction.command
    command_valid = current_instruction.command_valid
    pos_x_valid = current_instruction.pos_x_valid
    pos_y_valid = current_instruction.pos_y_valid
    face_valid = current_instruction.face_valid
    if (command_valid && pos_x_valid && pos_y_valid && face_valid && command == 'PLACE')
        answer_valid = true
        robot.place(current_instruction.pos_x,current_instruction.pos_y,current_instruction.face)
    else
        answer_valid = false
        puts "Please enter valid PLACE command (PLACE X,Y,FACE)"
    end
end

while (!answer_main_valid)
    puts "Enter instruction (MOVE | RIGHT | LEFT | REPORT):"
    ans = gets.chomp
    current_instruction.instruction = ans
    
    if (current_instruction.command == "PLACE")
        puts "Please enter valid instruction"
        answer_main_valid = false
    elsif (current_instruction.command_valid)
        dynamic_command = current_instruction.command.downcase
        robot.public_send(dynamic_command)
        if current_instruction.command == "REPORT"
            answer_main_valid = true
            report_position = robot.report
        end
    end
end

puts "Output: #{report_position[0]},#{report_position[1]},#{report_position[2]}"


