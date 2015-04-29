require 'grid'

RSpec.describe Grid do
	describe '#street names' do
		context 'Get street name' do
			grid = Grid.new(8, 8)
			street = grid.getStreet(2, 3)

			it 'should return William St and Lt Collins' do
    			expect(street).to eq("Lt Collins St x William St")
			end
		end

		context 'Get second street name' do
			grid = Grid.new(8, 8)
			street = grid.getStreet(5, 4)

			it 'should return Collins and Swanston St' do
    			expect(street).to eq("Bourke St x Swanston St")
			end
		end
	end
end