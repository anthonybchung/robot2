# receives a string and split it up into commands and position.
# e.g: "place 0,0,north" -> verify -> ['PLACE',[0,0,'NORTH']]
# e.g: 'move' -> verify -> ['MOVE']

class Instruction
    attr_reader :command_valid, :face_valid, :pos_x_valid, :pos_y_valid, :command, :pos_x, :pos_y, :face

    def initialize
        @valid_command = ['PLACE','MOVE','LEFT','RIGHT','REPORT']
        @valid_face = ['NORTH','SOUTH','EAST','WEST']
    end

    def instruction=(value)
        @value_cap = value.upcase.split(/\s/,2)
        @command = @value_cap[0]
        if @value_cap[1] == nil
            @position = nil
        else
            @position = @value_cap[1].gsub(/\s/,'').split(',')
        end

    #validate command.
        @valid_command.each {|item|
            @command_valid = (@command == item ? true : false)
            break if @command_valid
        }
    #validate face
        if @position != nil && @position.length() == 3
                validate_face
                validate_axis
        else
            @face_valid = false
            @pos_x_valid = false
            @pos_y_valid = false
        end
    end

    private

    def validate_face
        @valid_face.each {|item|
                @face_valid = (@position[2] == item ? true : false)
                @face = @position[2]
                break if @face_valid
            }
    end

    def validate_axis
        if @position[0].match(/\d/) != nil
            @pos_x_valid = @position[0].to_i.between?(0,5)
            @pos_x = @position[0].to_i if @position[0].to_i.between?(0,5)
        else
            @pos_x_valid = false
        end
        if @position[1].match(/\d/) != nil
            @pos_y_valid = @position[1].to_i.between?(0,5)
            @pos_y = @position[1].to_i if @position[1].to_i.between?(0,5)
        else
            @pos_y_valid = false
        end

    end

end
