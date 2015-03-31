require 'robocop'


RSpec.describe Robocop do
	describe '#forward' do
		context 'starting at the default position' do
			let(:robot) { Robocop.new }

			it 'should move forward' do
    			expect(robot.forward).to eq([0,1])
			end
		end

		context 'starting at another position' do
			let(:robot) {
				robot = Robocop.new
				robot.x = 100
				robot.y = 120
				return robot
			}

			it 'should move forward' do
				expect(robot.forward).to eq([100, 121])
			end
		end

		context 'starting at another position and direction' do
			let(:robot) {
				robot = Robocop.new
				robot.direction = :east
				return robot
			}

			it 'should move forwards' do
				expect(robot.forward).to eq([1,0])
			end
		end
	end

	describe '#backward' do
		context 'starting at the default position' do
			let(:robot) { Robocop.new }

			it 'should move backward' do
				expect(robot.backward).to eq([0,-1])
			end
		end
	end

	describe '#rotateleft' do
		context 'starting at the default position' do
			let(:robot) { Robocop.new }

			it 'should rotate left' do
				expect(robot.rotateLeft).to eq(:west)
			end
		end
	end

	describe '#rotateright' do
		context 'starting at the default position' do
			let(:robot) { Robocop.new }

			it 'should rotate right' do
				expect(robot.rotateRight).to eq(:east)
			end
		end
	end
end