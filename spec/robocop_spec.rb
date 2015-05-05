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
				expect(robot.forward).to eq([100, 120])
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

	describe '#boundary' do

		# Moving north
	    context 'Robot moves forwards within the boundary' do
	        robot = Robocop.new
	        it 'robot should be within boundary' do
	            expect(robot.isInBoundary?(0, 0)).to eq(true)
	        end
	    end

		context 'Robot moves forwards on the boundary' do
			robot = Robocop.new
			it 'Robot moves forwards on the boundary' do
				expect(robot.isInBoundary?(0, 4)).to eq(true)
			end
		end

		context 'Robot moves forwards out of boundary' do
			robot = Robocop.new
			it 'Robot moves forwards out of boundary' do
				expect(robot.isInBoundary?(0, 9)).to eq(false)
			end
		end

		# Moving south
		context 'Robot moves forwards within the boundary' do
	        robot = Robocop.new
	        it 'robot should be within boundary' do
	            expect(robot.isInBoundary?(0, 5)).to eq(true)
	        end
	    end

	    context 'Robot moves forwards on the boundary' do
	        robot = Robocop.new
	        it 'robot should be on boundary' do
	            expect(robot.isInBoundary?(0, 1)).to eq(true)
	        end
	    end

		context 'Robot moves forwards on the boundary' do
	        robot = Robocop.new
	        it 'robot should be on boundary' do
	            expect(robot.isInBoundary?(0, 0)).to eq(true)
	        end
	    end

		# Moving east
		context 'Robot is moving east' do
	        robot = Robocop.new
	        it 'robot should be within boundary' do
	            expect(robot.isInBoundary?(0, 0)).to eq(true)
	        end

	    end

		context 'Robot is moving east' do
			robot = Robocop.new
			it 'robot should be on boundary' do
	            expect(robot.isInBoundary?(4, 0)).to eq(true)
	        end
		end

		context 'Robot is moving east' do
			robot = Robocop.new
			it 'robot should be out of boundary' do
				expect(robot.isInBoundary?(9, 0)).to eq(false)
			end
		end


		# Move backwards
		context 'Robot moves backwards' do
			robot = Robocop.new
			robot.direction = :north
			robot.y = 4
			robot.x = 3
			robot.backward
			it 'robot should move backwards' do
				expect(robot.location).to eq({x: 3, y: 3})
			end
		end

		context 'Robot moves backwards' do
			robot = Robocop.new
			robot.direction = :east
			robot.y = 4
			robot.x = 3
			robot.backward
			it 'robot should move backwards' do
				expect(robot.location).to eq({x: 2, y: 4})
			end
		end
	end

	describe '#rotating' do

		# Turn left
		context 'Robot moves backwards' do
			robot = Robocop.new
			robot.direction = :north
			robot.rotateLeft
			it 'robot should face west' do
				expect(robot.direction).to eq(:west)
			end
		end

		context 'Robot moves backwards' do
			robot = Robocop.new
			robot.direction = :south
			robot.rotateLeft
			it 'robot should face east' do
				expect(robot.direction).to eq(:east)
			end
		end

		# Turn right
		context 'Robot moves backwards' do
			robot = Robocop.new
			robot.direction = :north
			robot.rotateRight
			it 'robot should face west' do
				expect(robot.direction).to eq(:east)
			end
		end

		context 'Robot moves backwards' do
			robot = Robocop.new
			robot.direction = :south
			robot.rotateRight
			it 'robot should face east' do
				expect(robot.direction).to eq(:west)
			end
		end

	end

	describe '#rotating' do
		context 'Robot moves to prescribed coordinates' do
			robot = Robocop.new
			robot.direction = :north
			robot.y = 0
			robot.x = 0
			path = robot.moveTo(2, 2)

			expectedPath = [{x: 0, y:1}, {x: 0,y: 2}, {x: 1,y: 2}, {x: 2,y: 2}]
			it 'robot should follow a path' do
				expect(path).to eq(expectedPath)
			end
		end
	end

	# describe '#leaving grid' do
	# 	context 'Robot moves to prescribed coordinates' do
	# 		robot = Robocop.new
	# 		robot.direction = :north
	# 		robot.y = 8
	# 		robot.x = 8
		
	# 		it 'Should not leave boundary' do
	# 			expect(robot.isInBoundary?).to eq(true)
	# 		end
	# 	end
	# end
end
