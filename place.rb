require_relative './position'
class Place
    attr_reader :place, :position, :FACE

    def initialize
        @FACE = ['NORTH','EAST','SOUTH','WEST']
    end
    def parse(value_str)
        raise "should be 'PLACE X,Y,FACE" unless /PLACE \d,\d,[a-zA-Z]{4,5}/.match? value_str
        value_array = value_str.split
        @place = value_array[0]
        @pos_str = value_array[1]

        @pos_array = @pos_str.split(',')
        if @FACE.include? @pos_array[2]
        @position = Position.new(@pos_array[0].to_i,@pos_array[1].to_i,@pos_array[2])
        else
            raise "FACE must be 'NORTH','EAST','SOUTH',or 'WEST'"
        end   
    end
end