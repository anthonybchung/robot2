require_relative 'position'
require_relative 'place'

# check if first word of instruction is valid.
# PLACE
# RIGHT
# LEFT
# REPORT

class Instruction

    attr_reader :instruction, :position, :FACE
    def initialize
        @First_word = ['PLACE','MOVE','RIGHT','LEFT','REPORT']
    end
    def parse(answer)
        answer_array = answer.split
        @instruction = answer_array[0]
        raise 'MUST BE PLACE, MOVE, RIGHT, LEFT, OR REPORT' unless @First_word.include? @instruction
        if @instruction == @First_word[0]
           place = Place.new
           place.parse(answer)
           @position = place.position
        end
    end
end