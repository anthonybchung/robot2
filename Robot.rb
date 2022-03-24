class PositionXYF
    @position_X
    @position_Y
    @position_F

    def put(position_X,position_Y,position_F)
        @position_X = position_X
        @position_Y = position_Y
        @position_F = position_F
    end 

    def putX(position_X)
        @position_X = position_X
    end

    def putY(position_Y)
        @position_Y = position_Y
    end

    def putF(position_F)
        @position_F = position_F
    end

    def getX()
        return @position_X
    end
    
    def getY()
        return @position_Y
    end

    def getF()
        return @position_F
    end
end

class Robot
    @position

    def initialize
        @position = PositionXYF.new;
    end

    def place(x,y,f)
        @position.putX(x)
        @position.putY(y)
        @position.putF(f)
    end
    def move
        if @position.getF == "NORTH"
            position_Y = @position.getY
            if position_Y < 5
                position_Y += 1
            end
            @position.putY(position_Y)
        elsif @position.getF == "EAST"
            position_X = @position.getX
            if position_X <5
                position_X += 1
            end
            @position.putX(position_X)
        elsif @position.getF == "SOUTH"
            position_Y = @position.getY
            if position_Y > 0
                position_Y -= 1
            end
            @position.putY(position_Y)
        elsif @position.getF == "WEST"
            position_X = @position.getX
            if position_X > 0 
                position_X -= 1
            end
            @position.putX(position_X)
        end
    end

    def left
        if @position.getF == "NORTH"
            @position.putF("WEST")
        elsif @position.getF == "EAST"
            @position.putF("NORTH")
        elsif @position.get == "SOUTH"
            @position.putF("EAST")
        elsif @position.getF == "WEST"
            @position.putF("SOUTH")
        end
    end

    def right
        if @position.getF == "NORTH"
            @position.putF("EAST")
        elsif @position.getF == "EAST"
            @position.putF("SOUTH")
        elsif @position.getF == "SOUTH"
            @position.putF("WEST")
        elsif @position.getF == "WEST"
            @position.putF("NORTH")
        end
    end

    def get_position
        return @position
    end
end


class RobotInstruction
    def is_number? string
        true if Float(string) rescue false
    end

    def check_place(place_string)
        place_array = place_string.split
        if place_array[0] == "PLACE"
            position = place_array[1].split(',')
            if is_number?(position[0]) && is_number?(position[1])
                if position[0].to_i.between?(0,5) && position[1].to_i.between?(0,5)
                    if position[2] == "NORTH" || position[2] == "EAST" || position[2] == "SOUTH" || position[2] == "WEST"
                        return true
                    end
                end
            end

        end
        false
    end
end

my_robot = Robot.new
robot_continue = true
valid = false
robot_instruction = RobotInstruction.new

puts "Place robot with the following format."
puts "PLACE X,Y,DIRECTION"

while !valid
    user_input = gets
    valid = robot_instruction.check_place(user_input)  
end

user_input_array = user_input.split
command = user_input_array[0]
position_array = user_input_array[1].split(',')
position_X = position_array[0].to_i;
position_Y = position_array[1].to_i;
position_F = position_array[2]


my_robot.place(position_X,position_Y,position_F)

while(robot_continue)
    command = gets.chomp
    case command 
        when "PLACE"
            my_robot.place(position_X,position_Y,position_F)
        when "MOVE"
            my_robot.move
        when "LEFT"
            my_robot.left
        when "RIGHT"
            my_robot.right
        when "REPORT"
            puts "Output: #{my_robot.get_position.getX},#{my_robot.get_position.getY},#{my_robot.get_position.getF}"
            robot_continue = false
    end
end

