require_relative '../place'

RSpec.describe 'PLACE X Y FACE string format' do
    it 'raise error if not PLACE d,d,NORTH' do
        place = Place.new
        expect{place.parse('PLACE 5,5,e')}.to raise_error(RuntimeError)
    end

    it 'first word should be PLACE' do
       place = Place.new
       place.parse('PLACE 5,5,NORTH')
       
       expect(place.place).to eq('PLACE')
    end

    it 'should raise an error due to wrong FACE' do
        place = Place.new
        expect{place.parse('PLACE 5,5,Esat')}.to raise_error(RuntimeError)
    end

    it 'return proper position attributes' do
        place =Place.new
        place.parse('PLACE 5,5,EAST')
        position = Position.new(5,5,'EAST')
        expect(place.position).to eq(position)
    end
end