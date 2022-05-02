require_relative 'table'
require_relative 'robot'
require_relative 'place'
require_relative 'instruction'

table = Table.new(5, 5)
robot = Robot.new(table)
instruction = Instruction.new

begin
  puts 'Enter PLACE'
  ans = gets.chomp
  place = Place.new
  place.parse(ans)
  robot.place(place.position)
rescue StandardError
  puts 'First input must be PLACE X,Y,FACE.'
  puts 'X,Y must be witin 0 and 5'
  puts 'FACE must be NORTH,SOUTH,EAST or WEST'
  retry
end

main_loop = true
while main_loop
  begin
    puts 'Enter next command'
    ans = gets.chomp
    instruction.parse(ans)
    case instruction.instruction
    when 'PLACE'
        robot.place(instruction.position)
    when 'MOVE'
        robot.move
    when 'LEFT'
        robot.left
    when 'RIGHT'
        robot.right
    end
  rescue StandardError
    puts 'Enter valid instruction'
    retry
  end
  main_loop = false if instruction.instruction == 'REPORT'
end

position_current = robot.position_current
  puts "Output: #{position_current.pos_x},#{position_current.pos_y},#{position_current.pos_f}"
