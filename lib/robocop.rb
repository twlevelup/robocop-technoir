# require 'grid'

class Robocop
	attr_accessor :x
	attr_accessor :y
	attr_accessor :direction
	attr_accessor :boundary

	def initialize(x = 0, y = 0)
		@x = x
		@y = y
		@direction = :north

		@boundary = {}
		@boundary['y'] = 8
		@boundary['x'] = 8
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
		allowed = false
		case @direction
		when :north
			allowed = isInboundary?(@x, @y + 1)

			if allowed
				@y = @y + 1
				puts "I just moved one block forwards"
			else
				puts "Cannot move forward; out of boundary"
			end
			
		when :east
			allowed = isInboundary?(@x + 1, @y)

			if allowed
				@x = @x + 1
				puts "I just moved one block forwards"
			else
				puts "Cannot move forward; out of boundary"
			end
			
		when :south
			allowed = isInboundary?(@x, @y - 1)

			if allowed
				@y = @y - 1
				puts "I just moved one block forwards"
			else
				puts "Cannot move forward; out of boundary"
			end
			
		when :west
			allowed = isInboundary?(@x - 1, @y)

			if allowed
				@x = @x - 1
				puts "I just moved one block forwards"
			else
				puts "Cannot move forward; out of boundary"
			end
			
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

	def isInboundary?(x, y)
		if((x <= @boundary['x'] && x >= 0) && (y <= @boundary['y'] && y >= 0))
			return true
		else
			return false
		end
	end
end
