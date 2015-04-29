# require 'io/console'

# class DisplayGrid
# 	attr_accessor :x
# 	attr_accessor :y
# 	attr_accessor :streetNames

# 	@matrix = [[00],
# 			   [01]]

# 	def initialize
# 		@grid = {}
# 		@grid['y'] = 5
# 		@grid['x'] = 5
# 	end

# 	def drawGrid
# 		@grid['x'].times
# 			puts "--"
# 			puts "|"

# 		puts "\n"

# 	end

# 	drawGrid()

# 	def read_char
# 		STDIN.echo = false
#   		STDIN.raw!
 
#   		input = STDIN.getc.chr
  	
#   		ensure
#   		STDIN.echo = true
#   		STDIN.cooked!
 
#   		return input
# 	end

# 	# def moveRobot
# 	# 	c = read_char
 
#  #  	case c
#  #    	puts "ESCAPE"
#  #  	when "\e[A"
#  #    	puts "UP ARROW"
#  #  	when "\e[B"
#  #    	puts "DOWN ARROW"
#  #  	when "\e[C"
#  #    	puts "RIGHT ARROW"
#  #  	when "\e[D"
#  #    	puts "LEFT ARROW"
  
# 	# end
# end

def drawGrid
		puts "Draw Grid"

		# @grid['x'].times
		# 	puts "--"
		# 	puts "|"

		# puts "\n"

		rowDash = "-" * 8 + "|"
		tabDash = " " * 8 + "|"

		5.times {
			5.times { print rowDash }

			print "\n"

			5.times { print tabDash }

			print "\n"

		}

		#str = "0" * 999999

		#puts str
	end

drawGrid