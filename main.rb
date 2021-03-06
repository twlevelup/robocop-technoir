require './lib/robocop.rb'
require './lib/grid.rb'
require './lib/griddisplay.rb'

# This will clear the screen, so that it's easier to use
system "cls"

robots = []

gridDisplay = GridDisplay.new(15,15)

#(2..6).to_a.sample.times {
    #robots.push(Robocop.new((0..8).to_a.sample, (0..8).to_a.sample))
    robots.push(Robocop.new(2,2, gridDisplay))
    robots.push(Robocop.new(0,2, gridDisplay))
    robots.push(Robocop.new(4,4, gridDisplay))
#}



robots.each_with_index { |robot, robotIndex|
    gridDisplay.grid[robot.x][robot.y] = '-' + (robotIndex+1).to_s + '-'
}

grid = Grid.new

puts "\n\n\n"
puts "Hi, I'm a robot moving system, here is what we can do..."
puts "You can move me in 4 directions, they are as follows:"

puts "\n\n"
puts "\t\t******Navigation******"
puts "\t\t# f: will move me forwards*"
puts "\t\t# b: will move me backwards*"
puts "\t\t# r: will rotate me right*"
puts "\t\t# l: will rotate me left*"
puts "\n\t\twhere # is the robot id you would like to control\n"
puts "\n"
puts "\t\t******Admin******"
puts "\t\tlist: will list all robot ids, locations, directions"
# puts "\t\tgo to [x, y]: will move me from my current location to a new location*"
puts "\n\n"
puts "* 1 block within the CBD grid"
puts "\n\n"
# puts "I am currently at #{grid.getStreet(robo.x, robo.y)}, facing #{robo.direction}"
gridDisplay.drawGrid
puts "\n\n"




while true


    puts "Please enter the command you would like me to carry out: "

    userInput = gets.strip

    case userInput
    when /[1-9]+\s*f/
        system "cls"
        selectedId = userInput.scan( /[1-9]+/).first.to_i - 1

        if selectedId < robots.length
            selectedRobot = robots[selectedId]
            selectedRobot.forward(selectedId,gridDisplay.grid)
            
            puts "I am currently at #{grid.getStreet(selectedRobot.x, selectedRobot.y)}, facing #{selectedRobot.direction}"
            puts "\n"

        else
            puts "Robot does not exist, please try again!"
        end
        
    when /[1-9]+\s*b/
        system "cls"
        selectedId = userInput.scan( /[1-9]+/).first.to_i - 1

        if selectedId < robots.length
            selectedRobot = robots[selectedId]
            selectedRobot.backward(selectedId,gridDisplay.grid)
            puts "I am currently at #{grid.getStreet(selectedRobot.x, selectedRobot.y)}, facing #{selectedRobot.direction}"
        else
            puts "Robot does not exist, please try again!"
        end
        
    when /[1-9]+\s*r/
        system "cls"
        selectedId = userInput.scan( /[1-9]+/).first.to_i - 1

        if selectedId < robots.length
            selectedRobot = robots[selectedId]
            selectedRobot.rotateRight
            puts "I just rotated to my right"
            puts "I am currently at #{grid.getStreet(selectedRobot.x, selectedRobot.y)}, facing #{selectedRobot.direction}"
        else
            puts "Robot does not exist, please try again!"
        end
    when /[1-9]+\s*l/
        system "cls"
        selectedId = userInput.scan( /[1-9]+/).first.to_i - 1

        if selectedId < robots.length
            selectedRobot = robots[selectedId]
            selectedRobot.rotateLeft
            puts "I just rotated to my left"
            puts "I am currently at #{grid.getStreet(selectedRobot.x, selectedRobot.y)}, facing #{selectedRobot.direction}"
        else
            puts "Robot does not exist, please try again!"
        end
    when 'list'
        system "cls"
        puts "\n"
        printf "%-10s %-40s %s\n", "id", "location", "direction"
        puts "-"*61
        count = 0
        robots.each { |r|
            printf "%-10s %-42s %s\n", "#{count + 1}", "#{grid.getStreet(r.x, r.y)}", "#{r.direction}"
            count += 1
        }

    when /go to \[[1-9]+\s*,\s*[1-9]+\]/
        system "cls"
        robo.rotateLeft
        x = userInput.scan( /[1-9]+/).first
        y = userInput.scan( /[1-9]+/).last

        puts "I will not move to [#{x}, #{y}]"

        path = robo.moveTo(x.to_i, y.to_i)

        puts "This is the path I took: \n"
        path.count.times { |i|
            puts path[i]
            sleep(0.5)
        }
    else
        system "cls"
        puts "I do not understand that command"
    end

    robots.each_with_index { |robot, robotIndex|
        gridDisplay.grid[robot.x][robot.y] = '-' + (robotIndex+1).to_s + '-'
    }
    
    gridDisplay.drawGrid
    # puts "Current lcoation is: [#{robo.x}, #{robo.y}]"
    #puts "\n\nWhats my next command?: "
end
