require_relative '../instruction'

RSpec.describe 'Check if instruction is valie' do
  it 'create an object Instructoin' do
    instr = Instruction.new
    expect(instr).to be_kind_of(Instruction)
  end

  it 'check if first word is correct' do
    instr = Instruction.new
    instr.parse('PLACE 4,5,NORTH')
    expect(instr.instruction).to eq('PLACE')
  end

  it 'raise error if first word is not PLACE,MOVE,RIGHT,LEFT,REPORT' do
    instr = Instruction.new
    expect { instr.parse('PLace') }.to raise_error(RuntimeError)
  end

  it 'raise error if X,Y,FACE is not in the correct format' do
    instr = Instruction.new
    expect { instr.parse('PLACE 4 4 NORTH') }.to raise_error(RuntimeError)
  end

  it 'should contain position with attributes' do
    instr = Instruction.new
    instr.parse('PLACE 4,4,NORTH')
    expect(instr.position).to have_attributes(pos_x: 4, pos_y: 4, pos_f: 'NORTH')
  end

  it 'should raise error if PLACE 3,3,NERTH' do
    instr = Instruction.new
    expect { instr.parse('PLACE 3,3,NERTH') }.to raise_error(RuntimeError)
  end
end
