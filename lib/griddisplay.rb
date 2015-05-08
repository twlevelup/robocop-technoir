class GridDisplay
	attr_accessor :x
	attr_accessor :y
	attr_accessor :grid

	def initialize(x=11,y=25)
		@x = x
		@y = y
		@grid = Array.new(@x) {Array.new(@y,'---')}
	end

	def drawGrid
		grid.each_with_index { |row, rowIndex|
			grid[rowIndex].each_with_index  { |cell, cellIndex|
				if grid[rowIndex][cellIndex] == '---'
					if cellIndex % 2 == 0
						grid[rowIndex][cellIndex] = '-+-'	
			 		end

			 		if rowIndex % 2 != 0
			 			if(cellIndex % 2 == 0)
							grid[rowIndex][cellIndex] = ' | '
						else
							grid[rowIndex][cellIndex] = '   '
						end
			 		end
			 	end
			}
		}

		for row in grid
			for cell in row
				print cell.to_s
			end
			print "\n"
		end
	end
end

#gridDisplay = GridDisplay.new(8,8)

#gridDisplay.drawGrid
