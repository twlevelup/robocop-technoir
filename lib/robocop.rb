class Robocop
	attr_accessor :x
	attr_accessor :y
	attr_accessor :direction
	attr_accessor :boundry

	def initialize(x = 0, y = 0)
		@x = x
		@y = y
		@direction = :north

		@boundry = {}
		@boundry['y'] = 5
		@boundry['x'] = 5
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

	def forward
		case @direction
		when :north
			@y = @y + 1
		when :east
			@x = @x + 1
		when :south
			@y = @y - 1
		when :west
			@x = @x - 1
		end

		[@x,@y]
	end

	def backward
		case @direction
		when :north
			@y = @y - 1
		when :east
			@x = @x - 1
		when :south
			@y = @y + 1
		when :west
			@x = @x + 1
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

	def inBoundry?
		if((@x <= @boundry['x'] && @x >= 0) && (@y <= @boundry['y'] && @y >= 0))
			return true
		else
			return false
		end
	end
end
