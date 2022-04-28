# frozen_string_literal: true

require_relative '../table'

RSpec.describe 'Create a table with walls:' do
  it 'create a simple table object with width and length' do
    table = Table.new(5, 5)
    expect(table).to have_attributes(width: 5, length: 5)
  end

  it 'raise error if string' do
    expect { Table.new('5', '5') }.to raise_error(NoMethodError)
  end

end
