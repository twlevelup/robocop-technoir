require 'grid'

RSpec.describe Grid do
	describe '#street names' do
		context 'Get street name' do
			grid = Grid.new(7, 7)
			street = grid.getStreet(2, 3)

			it 'should return Lt Burke St and Queen St' do
    			expect(street).to eq("Lt Collins St x Swanston St")
			end
		end

		context 'Get second street name' do
			grid = Grid.new(7, 7)
			street = grid.getStreet(5, 4)

			it 'should return Collins and Elizabeth' do
    			expect(street).to eq("Burke St x William St")
			end
		end
	end
end