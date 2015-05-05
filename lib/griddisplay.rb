#  require 'io/console'

#  class DisplayGrid
#  	attr_accessor :x
#  	attr_accessor :y

#  	def initialize
#  		@grid = {}
#  		@grid['y'] = 5
#  		@grid['x'] = 5
# 	end

# # 	def drawGrid
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


# def drawGrid
# 	puts "Draw Grid"

# 	rowDash = "-" * 8 + "|"

# 	0.upto(5) do |loop_y|

# 		0.upto(5) do |loop_x|

# 			if loop_x == 2 && loop_y == 1
# 				print "-" * 8 + "x"
# 			else
# 				print rowDash
# 			end
# 		end
# 		print "\n"
# 	end
# end

def drawGrid
	puts "Draw Grid"

	grid = Array.new(25) {Array.new(25,'--')}

	grid.each_with_index { |row, rowIndex|
		grid[rowIndex].each_with_index  { |cell, cellIndex|
			if cellIndex % 2 == 0
				grid[rowIndex][cellIndex] = '++'	
	 		end

	 		if rowIndex % 2 != 0
	 			if(cellIndex % 2 == 0)
					grid[rowIndex][cellIndex] = '||'
				else
					grid[rowIndex][cellIndex] = '  '
				end
	 		end
		}
	}

	grid[3][2] = 'xx'

	for row in grid
		for cell in row
			print cell.to_s
		end
		print "\n"
	end

	# rowIndex = 0

	# for row in grid

	# 	cellIndex = 0

	# 	# if(cellIndex % 2 == 0)
	# 	# 	grid[rowIndex][cellIndex] = '|'
	# 	# end

	# 	for cell in row
	# 		#print row.rindex(cell)
	# 		if cellIndex % 2 != 0
	# 			grid[rowIndex][cellIndex] = '+'	
	# 		end

	# 		if(cellIndex % 2 == 0)
	# 	# 	grid[rowIndex][cellIndex] = '|'
	# 	# end

	# 	cellIndex = cellIndex + 1
	# 	end
	# 	rowIndex = rowIndex + 1
	# end

	# for row in grid
	# 	for cell in row
	# 		print cell.to_s
	# 	end
	# 	print "\n"
	#end

	# rowDash = "-" * 8 + "|"
	# tabDash = " " * 8 + "|"

	# robotx = 0
	# roboty = 0

	# 0.upto(5) do |loop_y|

	# 	0.upto(5) do |loop_x|

	# 		if robotx == 0 && roboty == loop_y && loop_x == 0
	# 			print "x"
	# 		end

	# 		print "|"

	# 		if  loop_x == robotx && loop_y == roboty && loop_x != 0
	# 			print "-" * 8 + "x"
	# 		else
	# 			print rowDash
	# 		end
	# 	end
	# 	print "\n"

	# 	if loop_y != 5
	# 		print "|"
	# 		6.times {print tabDash}
	# 		print "\n"
	# 	end
	# end
end

drawGrid