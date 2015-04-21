class Robocop
	attr_accessor :x
	attr_accessor :y
	attr_accessor :direction
	attr_accessor :boundry

	def initialize
		@x = 0
		@y = 0
		@direction = :north

		@boundry = {}
		@boundry['y'] = 5
		@boundry['x'] = 5
	end

	def beep
		'beep boop'
	end

	def location
		return [@x,@y]
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

		if @direction == :north
			@y = @y - 1
			[@x,@y]
		end
	end

	def rotateLeft
		if @direction == :north
			@direction = :west
		end
	end

	def rotateRight
		if @direction == :north
			@direction = :east
		end
	end

	def inBoundry?
		if((@x <= @boundry['x'] && @x >= 0) && (@y <= @boundry['y'] && @y >= 0))
			return true
		else
			return false
		end
	end
end
