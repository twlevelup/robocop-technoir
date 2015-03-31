class Robocop
	attr_accessor :x
	attr_accessor :y
	attr_accessor :direction

	def initialize
		@x = 0
		@y = 0
		@direction = :north
	end

	def beep
		'beep boop'
	end

	def location
		return [@x,@y]
	end

	def forward
		if @direction == :north
			@y = @y + 1
			[@x,@y]

		else @direction == :east
			@x = @x + 1
			[@x,@y]

		end
	end

end
