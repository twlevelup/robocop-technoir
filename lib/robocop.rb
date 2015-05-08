class Robocop
	attr_accessor :x
	attr_accessor :y
	attr_accessor :direction
	attr_accessor :boundary

	def initialize(x = 0, y = 0, gridDisplay)
		@x = x
		@y = y
		@direction = :north

		@boundary = {}
		@boundary['y'] = gridDisplay.y
		@boundary['x'] = gridDisplay.x
	end

	def beep
		'beep boop'
	end

	def location
		return {x: @x, y: @y}
	end

	def direction
		return @direction
	end

	def forward(robotId,grid)
		allowed = false
		case @direction
		when :north
			allowed = isInBoundary?(@x, @y + 2)

			if allowed
				grid[@x][@y] = '---'
				@y = @y + 2

				grid[@x][@y] = "-" + (robotId+1).to_s + "-"


				puts "I just moved one block forwards"
			else
				puts "Cannot move forward; out of boundary"
			end
			
		when :east
			allowed = isInBoundary?(@x + 2, @y)

			if allowed
				grid[@x][@y] = '---'
				@x = @x + 2

				grid[@x][@y] = "-" + (robotId+1).to_s + "-"

				puts "I just moved one block forwards"
			else
				puts "Cannot move forward; out of boundary"
			end
			
		when :south
			allowed = isInBoundary?(@x, @y - 2)

			if allowed
				grid[@x][@y] = '---'
				@y = @y - 2

				grid[@x][@y] = "-" + (robotId+1).to_s + "-"

				puts "I just moved one block forwards"
			else
				puts "Cannot move forward; out of boundary"
			end
			
		when :west
			allowed = isInBoundary?(@x - 2, @y)

			if allowed
				grid[@x][@y] = '---'
				@x = @x - 2

				grid[@x][@y] = "-" + (robotId+1).to_s + "-"


				puts "I just moved one block forwards"
			else
				puts "Cannot move forward; out of boundary"
			end
			
		end

		[@x,@y]
	end

	def backward(robotId,grid)
		allowed = false
		case @direction
		when :north
			allowed = isInBoundary?(@x, @y - 2)

			if allowed
				grid[@x][@y] = '---'
				@y = @y - 2

				grid[@x][@y] = "-" + (robotId+1).to_s + "-"

				puts "I just moved one block backwards"
			else
				puts "Cannot move backward; out of boundary"
			end

		when :east
			allowed = isInBoundary?(@x - 2, @y)

			if allowed
				grid[@x][@y] = '---'
				@x = @x - 2

				grid[@x][@y] = "-" + (robotId+1).to_s + "-"

				puts "I just moved one block backwards"
			else
				puts "Cannot move backward; out of boundary"
			end
			
		when :south
			allowed = isInBoundary?(@x, @y + 2)

			if allowed
				grid[@x][@y] = '---'
				@y = @y + 2

				grid[@x][@y] = "-" + (robotId+1).to_s + "-"

				puts "I just moved one block backwards"
			else
				puts "Cannot move backward; out of boundary"
			end

			
		when :west
			allowed = isInBoundary?(@x + 2, @y)

			if allowed
				grid[@x][@y] = '---'
				@x = @x + 2

				grid[@x][@y] = "-" + (robotId+1).to_s + "-"

				puts "I just moved one block backwards"
			else
				puts "Cannot move backward; out of boundary"
			end
			
		end

		[@x,@y]
	end

	def rotateLeft

		case @direction
		when :north
			@direction = :west
		when :south
			@direction = :east
		when :east
			@direction = :north			
		when :west
			@direction = :south
		end

		@direction
	end

	def rotateRight
		case @direction
		when :north
			@direction = :east
		when :south
			@direction = :west
		when :east
			@direction = :south			
		when :west
			@direction = :north
		end

		@direction
	end

	def moveTo(x, y)
		x_diff = (@x - x).abs

		y_diff = (@y - y).abs

		self.direction = :north
		path = []
		y_diff.times {
			self.forward
			path.push(self.location)
		}

		self.rotateRight
		
		x_diff.times {	
			self.forward

			path.push(location)
		}

		path
	end

	def isInBoundary?(x, y)
		if((x <= @boundary['x'] && x >= 0) && (y <= @boundary['y'] && y >= 0))
			return true
		else
			return false
		end
	end
end
