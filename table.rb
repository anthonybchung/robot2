# frozen_string_literal: true

# A table with walls that will not allow robot to fall
class Table
  attr_reader :width, :length

  def initialize(width = 5, length = 5)
    @width = width.to_int
    @length = length.to_int
  end
end
